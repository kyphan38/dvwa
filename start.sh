#!/bin/bash

docker compose down

docker volume rm dvwa_dvwa dvwa_esdata 

docker compose up --build -d dvwa

dvwa_container_id=$(docker compose ps -q dvwa)

echo "Container id of dvwa: $dvwa_container_id" # Var only used while executing script

sed -i -E "s|containers/[^/]+/[^-]+-json\.log|containers/$dvwa_container_id/$dvwa_container_id-json.log|g" compose.yml
sed -i -E "s|containers//?-json\.log|containers/${dvwa_container_id}/${dvwa_container_id}-json.log|g" compose.yml


if grep -q "containers/$dvwa_container_id/$dvwa_container_id-json.log" compose.yml; then
  echo "Log path updated successfully"
else
  echo "Failed to update log path"
fi

docker compose up --build -d elasticsearch kibana logstash

echo "Waiting for setting up"
sleep 30

for user in apm_system kibana_system kibana logstash_system beats_system remote_monitoring_user;
do
  curl -X POST -u elastic:password "localhost:9200/_security/user/$user/_password?pretty" -H 'Content-Type: application/json' -d'
  {
    "password" : "password"
  }
  '
done

sleep 20

# Create index pattern using API
curl -sX POST -u elastic:password "localhost:8080/api/index_patterns/index_pattern" -H 'kbn-xsrf: true' -H 'Content-Type: application/json' -d'{
  "index_pattern": {
    "title": "dvwa-logs",
	  "timeFieldName": "@timestamp"
  }
}
' -o /dev/null

echo "Done"
