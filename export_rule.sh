#!/bin/bash

# curl -X POST -u elastic:password "localhost:8080/api/detection_engine/rules/_export?exclude_export_details=true&file_name=exported_rules.ndjson" -H 'kbn-xsrf: true' -H 'Content-Type: application/json' -d'
# {
#   "objects": [
#     {
#       "rule_id":"0754bb00-412a-11ef-ac91-d9c4703219bb"
#     }
#   ]
# }
# ' -o ./config/kibana/rule/exported_rules.ndjson

#!/bin/bash

curl -X POST -u elastic:password "http://localhost:8080/api/detection_engine/rules/_export?exclude_export_details=true&file_name=exported_rules.ndjson" \
-H 'kbn-xsrf: true' \
-H 'Content-Type: application/json' \
-d '
{
  "objects": [
    {
      "rule_id": "0754bb00-412a-11ef-ac91-d9c4703219bb"
    }
  ]
}' -o ./config/kibana/rule/exported_rules.ndjson

