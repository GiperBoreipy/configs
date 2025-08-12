#!/bin/bash

SOURCE_DIR="$HOME/.config/nvim"
DEST_DIR="./nvim"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Ошибка: исходная директория $SOURCE_DIR не существует."
    exit 1
fi

mkdir -p "$DEST_DIR"

rsync -av --force "$SOURCE_DIR"/* "$DEST_DIR"/

echo "Все файлы успешно перемещены из $SOURCE_DIR в $DEST_DIR"
