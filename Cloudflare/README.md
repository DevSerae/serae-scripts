# DevSerae/serae-scripts/Cloudflare

These scripts are meant to be used in an environment where [pterodactyl](https://pterodactyl.io) is used. However, they can be made to work with pretty much any environment. Feel free to reference this if you are creating your own script.

---

## Requirements

Make sure you have [jq](https://jqlang.org/) installed to parse the JSON response given by the Cloudflare API. You can install [jq](https://jqlang.org/) using your package manager, e.g.:

```bash
sudo apt install jq
```

on Debian/Ubuntu.

## Security Note

⚠️ The script currently includes placeholder API tokens and IDs. In production:

- These values should be stored securely.

- Consider moving sensitive values to environment variables or a secure configuration file.
  
- Do not use the same API key for multiple scripts, especially for ones that only need read permissions.

---

### 📜[cloudflare-get-record_id.sh](https://github.com/DevSerae/serae-scripts/blob/main/Cloudflare/cloudflare-get-record_id.sh)

This script retrieves the A record ID for a specific DNS record in a Cloudflare zone. It uses the Cloudflare API to query the DNS records for a given zone and record name. Running this script will output the record ID for the specified record name. If the record does not exist, it will output nothing.

Please make sure the following has been set before running the script:

```bash
ZONE_ID="YOUR_CF_ZONE_ID" # Located in your CF dashboard (overview).
RECORD_NAME="subdomain.example.com"
CF_API_TOKEN="YOUR_CF_API_TOKEN" # Located in your CF profile.
```

---

### 📜[cloudflare-update-records.sh](https://github.com/DevSerae/serae-scripts/blob/main/Cloudflare/cloudflare-update-records.sh)

This script checks, and updates (if needed) the IP address for your records in Cloudflare. It uses the Cloudflare API to query and update the given records. Running this script will output nothing if no changes have been made, but will forward the output from the API when changes are being made.

Please make sure the following has been set before running the script:

```bash
CF_API_TOKEN="YOUR_CF_API_TOKEN" # Located in your CF profile.
CF_ZONE_ID="YOUR_CF_ZONE_ID" # Located in your CF dashboard (overview).

CF_PANEL_RECORD_ID="abcdefg1234" # Replace this with your actual record ID for panel.example.com
CF_NODE_RECORD_ID="abcdefg1234"  # Replace this with your actual record ID for node.example.com

PANEL_FDQN="panel.example.com" # Replace with your actual FQDN for the panel
NODE_FDQN="node.example.com" # Replace with your actual FQDN for the node
```
