#!/bin/bash
# =========================================
# Menu For Script
# Edition : Stable Edition V2.0
# Auther  : VRS TUNNELING X ASterCraft45
# (C) Copyright 2024-2025
# =========================================
MYIP=$(wget -qO- icanhazip.com);
apt install jq curl -y
clear
read -p "Masukan Domain contoh :sg70 :" domen
DOMAIN=netvpnproject.me
sub=${domen}
#(</dev/urandom tr -dc a-z0-9 | head -c5)
dns=${sub}.netvpnproject.me
CF_ID=nungkauu@gmail.com
CF_KEY=6c21745961f0603da54a9c135b93e96d29c69
set -euo pipefail
IP=$(wget -qO- icanhazip.com);
echo "Updating Domain for ${dns}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${dns}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${dns}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${dns}'","content":"'${IP}'","ttl":120,"proxied":false}')
echo "$dns" > /root/domain
echo "$dns" > /root/scdomain
echo "$dns" > /etc/xray/domain
echo "$dns" > /etc/v2ray/domain
echo "$dns" > /etc/xray/scdomain
echo "$MYIP=$dns" > /var/lib/lynz/ipvps.conf
cd
