#!/bin/bash


# Cloudflare API credentials:
CF_API_TOKEN="abcdefghijklmnop1234567890qrstuvwxyz" # Replace with your actual API token
CF_ZONE_ID="abcdefghijklmnop1234567890qrstuvwxyz" # Replace with your actual zone ID

# Record IDs:
# If you don't know the record IDs, you can fetch them using the Cloudflare API.
# You can find another script in my repository that lists the record ID for a specific record.
CF_PANEL_RECORD_ID="abcdefghijklmnop1234567890qrstuvwxyz"  # Replace this with your actual record ID for panel.example.com
CF_NODE_RECORD_ID="abcdefghijklmnop1234567890qrstuvwxyz"  # Replace this with your actual record ID for node.example.com

# FQDNs for the records:
PANEL_FDQN="panel.example.com" # Replace with your actual FQDN for the panel
NODE_FDQN="node.example.com" # Replace with your actual FQDN for the node

# -- Don't edit anything below this line --

# Get your current public IP
CURRENT_IP=$(curl -s ifconfig.me)

# Fetch the current A-record IPs from Cloudflare
OLD_IP_PANEL=$(curl -s "https://api.cloudflare.com/client/v4/zones/$CF_ZONE_ID/dns_records/$CF_PANEL_RECORD_ID" \
  -H "Authorization: Bearer $CF_API_TOKEN" | jq -r .result.content)

OLD_IP_NODE=$(curl -s "https://api.cloudflare.com/client/v4/zones/$CF_ZONE_ID/dns_records/$CF_NODE_RECORD_ID" \
  -H "Authorization: Bearer $CF_API_TOKEN" | jq -r .result.content)


# Check if the panel IP has changed
if [ "$CURRENT_IP" != "$OLD_IP_PANEL" ]; then
  # Update panel.example.com
  curl -X PUT "https://api.cloudflare.com/client/v4/zones/$CF_ZONE_ID/dns_records/$CF_PANEL_RECORD_ID" \
    -H "Authorization: Bearer $CF_API_TOKEN" \
    -H "Content-Type: application/json" \
    --data "{\"type\":\"A\",\"name\":\"$PANEL_FDQN\",\"content\":\"$CURRENT_IP\",\"ttl\":120}"
fi


# Check if the node IP has changed
if [ "$CURRENT_IP" != "$OLD_IP_NODE1" ]; then
  # Update node.example.com
  curl -X PUT "https://api.cloudflare.com/client/v4/zones/$CF_ZONE_ID/dns_records/$CF_NODE_RECORD_ID" \
    -H "Authorization: Bearer $CF_API_TOKEN" \
    -H "Content-Type: application/json" \
    --data "{\"type\":\"A\",\"name\":\"$NODE_FDQN\",\"content\":\"$CURRENT_IP\",\"ttl\":120}"
fi