#!/bin/bash

get_file_contents() {
  local file="$1"

  if [ ! -f "$file" ]; then
    echo "Ошибка: файл не существует ($file)" >&2
    return 1
  fi

  if [ ! -s "$file" ]; then
    echo "Файл пустой: $file" >&2
    return 1
  fi

  local content
  content=$(< "$file")

  # Убираем нулевые байты
  content=$(echo "$content" | tr -d '\000')

  echo "$content"
}