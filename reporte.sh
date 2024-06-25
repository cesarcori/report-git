#!/bin/bash

FECHA_DESDE=${1:-2024-05-01}
FECHA_HASTA=${2:-2024-06-01}
AUTHOR=${3:-cori}

current_datetime=$(date +'%Y-%m-%d_%H-%M-%S')
# name_repository=$(basename)
PATH_REPORT=/tmp/reporte-git_$current_datetime.txt

echo "Reporte GIT desde $FECHA_DESDE hasta: $FECHA_HASTA"
echo "Autor: $AUTHOR"
echo "Ruta del archivo: $PATH_REPORT"

git log --since="$FECHA_DESDE" --until="$FECHA_HASTA" --author="$AUTHOR" --oneline --pretty=format:"%h - %ad : %s" --date=format:"%B %d, %H:%M:%S" --all >> $PATH_REPORT
cat $PATH_REPORT | less