#!/bin/bash
if [ "$1" == "--logs" ]; then
    liczba=100  
    if [ "$2" ]; then  
        liczba=$2
    fi
    for i in $(seq 1 $liczba); do
        echo "log$i.txt - skrypt.sh - $(date)" > "log$i.txt"
    done
elif [ "$1" == "--help" ]; then
    echo "Dostępne opcje:"
    echo "--date - wyświetla dzisiejszą datę"
    echo "--logs [liczba] - tworzy pliki logów"
    echo "--help - wyświetla pomoc"

fi
