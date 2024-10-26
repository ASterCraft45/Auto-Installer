# =========================================
# Menu For Script
# Edition : Stable Edition V2.0
# Auther  : VRS TUNNELING X ASterCraft45
# (C) Copyright 2024-2025
# =========================================
REPO="https://aio.netvpnproject.me/"
wget -q -O /etc/systemd/system/limitvmess.service "${REPO}PACKAGE/limitvmess.service" && chmod +x limitvmess.service >/dev/null 2>&1
wget -q -O /etc/systemd/system/limitvless.service "${REPO}PACKAGE/limitvless.service" && chmod +x limitvless.service >/dev/null 2>&1
wget -q -O /etc/systemd/system/limittrojan.service "${REPO}PACKAGE/limittrojan.service" && chmod +x limittrojan.service >/dev/null 2>&1
wget -q -O /etc/systemd/system/limitshadowsocks.service "${REPO}PACKAGE/limitshadowsocks.service" && chmod +x limitshadowsocks.service >/dev/null 2>&1
wget -q -O /etc/xray/limit.vmess "${REPO}PACKAGE/vmess" >/dev/null 2>&1
wget -q -O /etc/xray/limit.vless "${REPO}PACKAGE/vless" >/dev/null 2>&1
wget -q -O /etc/xray/limit.trojan "${REPO}PACKAGE/trojan" >/dev/null 2>&1
wget -q -O /etc/xray/limit.shadowsocks "${REPO}PACKAGE/shadowsocks" >/dev/null 2>&1
chmod +x /etc/xray/limit.vmess
chmod +x /etc/xray/limit.vless
chmod +x /etc/xray/limit.trojan
chmod +x /etc/xray/limit.shadowsocks
systemctl daemon-reload
systemctl enable --now limitvmess
systemctl enable --now limitvless
systemctl enable --now limittrojan
systemctl enable --now limitshadowsocks
# systemctl start limitvmess
# systemctl start limitvless
# systemctl start limittrojan
# systemctl start limitshadowsocks
# systemctl restart limitvmess
# systemctl restart limitvless
# systemctl restart limittrojan
# systemctl restart limitshadowsocks
