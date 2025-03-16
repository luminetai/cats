#!/bin/bash

get_file_contents() {
  local file="$1"
  
  if [ ! -f "$file" ]; then
    echo "Ошибка: файл не существует или не является обычным файлом." >&2
    return 1
  fi
  
  if [ ! -s "$file" ]; then
    echo "Файл пустой: $file" >&2
    return 1
  fi
  
  #cat "$file"
}