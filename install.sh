#!/bin/bash

# Устанавливаем путь для скрипта cats
CATS_DIR="$HOME/.cats"
CATS_SCRIPT="$CATS_DIR/cats.sh"

# Создаем директорию для установки
mkdir -p "$CATS_DIR"

# Качаем скрипт с GitHub
curl -sSL https://github.com/username/repository/raw/main/cats.sh -o "$CATS_SCRIPT"

# Делаем скрипт исполнимым
chmod +x "$CATS_SCRIPT"

# Создаем символьную ссылку в /usr/local/bin для удобного вызова
ln -s "$CATS_SCRIPT" /usr/local/bin/cats

echo "cats успешно установлен. Теперь вы можете использовать команду cats в терминале."
