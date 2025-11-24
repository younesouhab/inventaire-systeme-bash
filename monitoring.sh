#!/bin/bash

echo "===== MONITORING RESEAU ====="
date
echo ""

targets=("8.8.8.8" "1.1.1.1" "google.com" "github.com" "192.168.1.1")

for ip in "${targets[@]}"
do
    echo "Test de $ip ..."
    if ping -c 1 $ip > /dev/null 2>&1
    then
        echo "[OK] $ip est accessible"
    else
        echo "[ALERTE] Impossible d’accéder à $ip !"
    fi
    echo "----------------------------------"
done

echo "===== FIN DU MONITORING ====="
