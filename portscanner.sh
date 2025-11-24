#!/bin/bash

echo "===== MINI PORT SCANNER ====="

if [ -z "$1" ]; then
    echo "Usage : ./portscanner.sh <IP>"
    exit 1
fi

IP=$1

echo ""
echo "Scan des ports sur $IP ..."
echo ""


ports=(22 80 443 21 25 53 110 139 445 3306 8080)

for port in "${ports[@]}"
do
    (echo > /dev/tcp/$IP/$port) >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "[OUVERT] Port $port"
    else
        echo "[FERMÉ]  Port $port"
    fi
done

echo ""
echo "===== FIN DU SCAN ====="
