#!/bin/bash

curl -sX POST "http://localhost:8080/api/kibana/dashboards/import" -H 'kbn-xsrf: true' -H 'Content-Type: application/json' -d @./kibana/dashboard.ndjson -o /dev/null