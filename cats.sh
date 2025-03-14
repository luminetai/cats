#!/bin/bash

# Функция для создания .cats
create_cats() {
  local directory="$1"
  find "$directory" -type f > .cats
}

# Функция для сохранения содержимого файлов в .cats
save_to_file() {
  xargs -a .cats cat > .cats
}

# Основная логика
cats() {
  local create_file="${1:-true}"
  local directory="${2:-.}"

  if [ "$create_file" = "true" ]; then
    create_cats "$directory"
  fi

  # Проверка наличия .cats
  if [ ! -f .cats ]; then
    echo "Error: .cats not found."
    exit 1
  fi

  # Сохранение содержимого файлов в .cats
  save_to_file

  echo "Content saved to .cats. You can view it with 'cat .cats' or 'less .cats'."
}

# Обработка флагов
case "$1" in
  -r)
    cats true "$2"  # Включаем создание .cats с флагом -r
    ;;
  -w)
    cats false "$2"  # Пропускаем создание .cats с флагом -w
    ;;
  *)
    cats "$1" "$2"  # По умолчанию сохраняем содержимое в .cats
    ;;
esac
