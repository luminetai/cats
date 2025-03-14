#!/bin/bash

# Функция для создания .catsread
create_catsread() {
  local directory="$1"
  find "$directory" -type f > .catsread
}

# Функция для копирования содержимого файлов в буфер обмена
copy_to_clipboard() {
  xargs -a .catsread cat | {
    if command -v xclip &>/dev/null; then
      xclip -selection clipboard
    elif command -v pbcopy &>/dev/null; then
      pbcopy
    else
      echo "Error: Neither xclip nor pbcopy found, unable to copy to clipboard."
      exit 1
    fi
  }
}

# Основная логика
cats() {
  local create_file="${1:-true}"
  local directory="${2:-.}"

  if [ "$create_file" = "true" ]; then
    create_catsread "$directory"
  fi

  # Проверка наличия .catsread
  if [ ! -f .catsread ]; then
    echo "Error: .catsread not found."
    exit 1
  fi

  # Копирование содержимого файлов в буфер обмена
  copy_to_clipboard
}

# Обработка флагов
case "$1" in
  -r)
    cats true "$2"  # Включаем создание .catsread с флагом -r
    ;;
  -w)
    cats false "$2"  # Пропускаем создание .catsread с флагом -w
    ;;
  *)
    cats "$1" "$2"  # По умолчанию выполняем копирование содержимого в буфер обмена
    ;;
esac
