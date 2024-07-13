#!/bin/bash

curl -sX POST -u elastic:password "http://localhost:8080/api/kibana/dashboards/import" -H 'kbn-xsrf: true' -H 'Content-Type: application/json' -d @./config/kibana/dashboard.ndjson -o /dev/null
