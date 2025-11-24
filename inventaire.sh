#!/bin/bash

echo "---------- Inventaire Système ----------"
echo "Utilisateur connecté : $(whoami)"
echo "Nom de la machine : $(hostname)"
echo "Adresse IP : $(hostname -I)"
echo "Version OS : $(lsb_release -d | awk -F ':' '{print $2}')"
echo "RAM totale : $(free -h | grep Mem | awk '{print $2}')"
echo "Espace disque : $(df -h / | awk 'NR==2 {print $4}')"
echo "Uptime : $(uptime -p)"
echo "Utilisateurs existants :"
cut -d: -f1 /etc/passwd
echo "-----------------------------------------"
