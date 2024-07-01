#!/bin/bash
current_date=$(date +'%Y-%m-%d 00:')

AUTHOR=${1:-}
FECHA_DESDE=${2:-$current_date 00:00:00}
FECHA_HASTA=${3:-$current_date 23:59:59}

current_datetime=$(date +'%Y%m%d_%H%M%S')
name_repository=$(basename $PWD)
PATH_REPORT=/tmp/reporte-git_$AUTHOR"_"$name_repository"_"$current_datetime.txt
autor_email=$(git log --author=$AUTHOR --pretty=format:"Autor: %aN - %aE" | head -n 1)

# Prompt
echo "Reporte desde $FECHA_DESDE hasta: $FECHA_HASTA"
echo "Ruta del archivo: $PATH_REPORT"
echo $autor_email

# Write file
{
  echo "Reporte desde $FECHA_DESDE hasta: $FECHA_HASTA"
  echo Repositorio: $name_repository
  echo $autor_email
  echo ""
  git log --since="$FECHA_DESDE" --until="$FECHA_HASTA" --author="$AUTHOR" --oneline --pretty=format:"%h - %ad : %s" --date=format:"%B %d, %H:%M:%S" --all
} >> $PATH_REPORT
