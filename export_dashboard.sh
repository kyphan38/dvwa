#!/bin/bash

curl -sX GET "localhost:8080/api/kibana/dashboards/export?dashboard=83ab3640-3f89-11ef-9e2d-fd4073e69c74" -H 'kbn-xsrf: true' -o ./config/kibana/dashboard.ndjson -o /dev/null