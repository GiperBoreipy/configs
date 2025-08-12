#!/bin/bash

SOURCE_DIR="./nvim"
DEST_DIR="$HOME/.config/nvim"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Ошибка: исходная директория $SOURCE_DIR не существует."
    exit 1
fi

mkdir -p "$DEST_DIR"

rsync -av --force "$SOURCE_DIR"/* "$DEST_DIR"/

echo "Все файлы успешно возвращены в $DEST_DIR"
