#!/bin/bash
show_help() {
    echo "Dostępne opcje:"
    echo "--date, -d              Wyświetla dzisiejszą datę"
    echo "--logs [n], -l [n]      Tworzy n plików log (domyślnie 100)"
    echo "--error [n], -e [n]     Tworzy n plików błędów w katalogu errorx (domyślnie 100)"
    echo "--init                  Klonuje repozytorium i dodaje je do PATH"
    echo "--help, -h              Wyświetla tę pomoc"
}

case "$1" in
    --logs|-l)
        liczba=${2:-100}
        for i in $(seq 1 $liczba); do
            echo "log$i.txt - skrypt.sh - $(date)" > "log$i.txt"
        done
        ;;

    --error|-e)
        liczba=${2:-100}
        mkdir -p errorx
        for i in $(seq 1 $liczba); do
            echo "error$i.txt - skrypt.sh - $(date)" > "errorx/error$i.txt"
        done
        ;;

    --date|-d)
        date
        ;;

    --help|-h)
        show_help
        ;;

    --init)
        REPO_URL="https://github.com/Ivanszalony/Lab_IT_Tools.git"
        git clone "$REPO_URL"
        REPO_DIR="Lab_IT_Tools"
        if [ -d "$REPO_DIR" ]; then
            export PATH="$(pwd)/$REPO_DIR:\$PATH"
            echo "Repozytorium sklonowane do $(pwd)/$REPO_DIR"
            echo "Ścieżka dodana do PATH: $(pwd)/$REPO_DIR"
        else
            echo "Nie udało się sklonować repozytorium"
        fi
        ;;

    *)
        echo "Nieznana opcja: $1"
        echo "Użyj --help, aby zobaczyć dostępne opcje"
        ;;
esac
