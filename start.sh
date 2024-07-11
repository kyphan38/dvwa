#!/bin/bash

docker compose down

docker compose up --build -d dvwa

dvwa_container_id=$(docker compose ps -q dvwa)

echo "Container id of dvwa: $dvwa_container_id" # Var only used while executing script

sed -i -E "s|containers/[^/]+/[^-]+-json\.log|containers/$dvwa_container_id/$dvwa_container_id-json.log|g" compose.yml

if grep -q "containers/$dvwa_container_id/$dvwa_container_id-json.log" compose.yml; then
    echo "Log path updated successfully"
else
    echo "Failed to update log path"
fi

docker compose up --build -d elasticsearch kibana logstash