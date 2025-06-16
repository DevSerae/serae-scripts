#!/bin/bash

ZONE_ID="abcdefghijklmnop1234567890qrstuvwxyz" # Replace with your actual zone ID
RECORD_NAME="panel.example.com" # Replace with the record name you want to query

CF_API_TOKEN="abcdefghijklmnop1234567890qrstuvwxyz" # Replace with your actual API token

# -- Don't edit anything below this line --

curl -sS \
  --get "https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records" \
  --data-urlencode "name=${RECORD_NAME}" \
  --data-urlencode "type=A" \
  -H "Authorization: Bearer ${CF_API_TOKEN}" \
  -H "Content-Type: application/json" \
| jq -r '.result[0].id // empty'