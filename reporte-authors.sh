
current_date=$(date +'%Y-%m-%d')
FECHA_DESDE=${1:-$current_date}
FECHA_HASTA=${2:-$current_date}

current_datetime=$(date +'%Y-%m-%d_%H-%M-%S')
name_repository=$(basename $PWD)
echo $name_repository
PATH_REPORT=/tmp/reporte-git_$name_repository"_"$current_datetime.txt


authors=$(git log --format="%aN" --since=2024-06-01 | sort -u)

for author in "${authors[@]}"; do
  echo "*******"
  echo "Reporte GIT desde $FECHA_DESDE hasta: $FECHA_HASTA"
  echo "Autor: $author"
  echo "Ruta del archivo: $PATH_REPORT"
done
# git log --since="$FECHA_DESDE" --until="$FECHA_HASTA" --author="$AUTHOR" --oneline --pretty=format:"Rama: %d - %h - %ad : %s" --date=format:"%B %d, %H:%M:%S"--all >> $PATH_REPORT
# cat $PATH_REPORT | less
# git log --since="$FECHA_DESDE" --until="$FECHA_HASTA" --author="$AUTHOR" --oneline --pretty=format:"%h - %ad : %s" --date=format:"%B %d, %H:%M:%S" --all | cat