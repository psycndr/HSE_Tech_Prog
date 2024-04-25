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

find "$1" -type f -exec sh -c 'cp "$1" "$2/$(basename "${1%.*}")_$(date +%H%M%S).${1##*.}"' _ {} "$2" \;
