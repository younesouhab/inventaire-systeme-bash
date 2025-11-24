#!/bin/bash

LOG_FILE="/var/log/auth.log"

if [ ! -f "$LOG_FILE" ]; then
    echo "[!] $LOG_FILE introuvable, tentative avec /var/log/syslog"
    LOG_FILE="/var/log/syslog"
fi

if [ ! -f "$LOG_FILE" ]; then
    echo "[ERREUR] Aucun fichier de log trouvé."
    exit 1
fi

echo "===== ANALYSE DE LOGS DE SECURITE ====="
echo "Fichier analysé : $LOG_FILE"
echo "Date : $(date)"
echo "----------------------------------------"

echo ""
echo "1) Tentatives de connexion échouées :"
grep "Failed password" "$LOG_FILE" | tail -n 20 || echo "Aucune entrée."

echo ""
echo "2) IP suspectes (Top 10) :"
grep "Failed password" "$LOG_FILE" | \
awk '{for(i=1;i<=NF;i++){if($i=="from"){print $(i+1)}}}' | \
sort | uniq -c | sort -nr | head

echo ""
echo "3) Connexions réussies :"
grep "Accepted password" "$LOG_FILE" | wc -l

echo ""
echo "4) Connexions root réussies :"
grep "Accepted password" "$LOG_FILE" | grep "root" | wc -l

echo ""
echo "===== FIN DU RAPPORT ====="
