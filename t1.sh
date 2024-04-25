if [ "$#" -ne 2 ]; then
	echo "Ошибка: Передано не два параметра"
	exit 1
fi

if [ ! -d "$1" ]; then
	echo "Ошибка: Входная директория не существует"
	exit 1
fi

if [ ! -d "$2" ]; then
	echo "Ошибка: Выходная директория не существует"
	exit 1
fi

for file in $(find "$1" -type f); do
	filename=$(basename "$file")
	extension="${filename##*.}"
	filename="${filename%.*}"
	new_filename="$filename.$extension"

	if [ -f "$2/$new_filename" ]; then
		new_filename="${filename}_copy_$(date +%Y%m%d%H%M%S%3N).$extension"
	fi
	cp "$file" "$2/$new_filename"

done
