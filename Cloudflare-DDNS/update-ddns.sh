#!/bin/bash
NEW_IP=$(awk -F ',' 'NR==2 {print $1}' /root/cloudflareST/result.csv)
## Cloudflare API Key and Zone ID
API_KEY="UhXlVxdErAkTxxxxx"#api令牌，区域的哪个
EMAIL="wf1213xxx"#邮箱
ZONE_ID="bfaaa34a44cxxxxd"#域名页面概况显示的区域id
RECORD_NAME="cf1.4xxxx.xyz"#完整域名
## Cloudflare API endpoint for updating DNS record
API_ENDPOINT="https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records"
#
## Get the current DNS record ID
CURRENT_RECORD_ID=$(curl -sX GET "$API_ENDPOINT?type=A&name=$RECORD_NAME" \
-H "Authorization: Bearer $API_KEY" \
-H "Content-Type: application/json" | jq -r '.result[0].id')

## Update the DNS record with the new IP address
curl -sX PUT "$API_ENDPOINT/$CURRENT_RECORD_ID" \
-H "Authorization: Bearer $API_KEY" \
-H "Content-Type: application/json" \
--data "{\"type\":\"A\",\"name\":\"$RECORD_NAME\",\"content\":\"$NEW_IP\",\"ttl\":120,\"proxied\":false}"

echo "DNS record for $RECORD_NAME updated with IP address: $NEW_IP"
