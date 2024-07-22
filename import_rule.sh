#!/bin/bash

curl -sX POST -u elastic:password "http://localhost:8080/api/detection_engine/rules/_import" \
-H 'kbn-xsrf: true' \
-H 'Content-Type: multipart/form-data' \
--form "file=@./config/kibana/rule/rules_export.ndjson"