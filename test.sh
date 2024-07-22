URL="localhost:8080"
response=$(curl -s -w -u elastic:password "%{http_code}" $URL)

http_code=$(tail -n1 <<< "$response")  # get the last linecontent=$(sed '$ d' <<< "$response")   # get all but the last line which contains the status code
echo "$http_code"
echo "$content"
