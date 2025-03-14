#!/bin/bash

# Скачиваем cats в /usr/local/bin
CATS_PATH="/usr/local/bin/cats"

# Проверяем, существует ли уже cats
if [ -f "$CATS_PATH" ]; then
  echo "cats уже установлен."
  exit 0
fi

# Скачиваем скрипт в /usr/local/bin
echo "Устанавливаю cats..."
curl -fsSL https://github.com/luminetai/cats/raw/main/cats -o "$CATS_PATH"

# Делаем его исполняемым
chmod +x "$CATS_PATH"

# Проверяем успешность установки
if command -v cats >/dev/null 2>&1; then
  echo "cats успешно установлен!"
else
  echo "Ошибка установки cats."
  exit 1
fi
