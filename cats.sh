#!/bin/bash

OUTPUT_FILE=".cats"
STRUCTURE_PREFIX="structure:"
CONTENT_PREFIX="content:"
DEFAULT_FLAGS="DNSU"

# Получаем путь к директории, где находится cats.sh
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Подключаем файлы с функциями
source "$SCRIPT_DIR/utils/clean_string.sh"
source "$SCRIPT_DIR/utils/get_directory_items.sh"
source "$SCRIPT_DIR/utils/get_directory_structure.sh"
source "$SCRIPT_DIR/utils/get_file_contents.sh"
source "$SCRIPT_DIR/utils/get_network_info.sh"
source "$SCRIPT_DIR/utils/get_user_info.sh"
source "$SCRIPT_DIR/utils/get_system_info.sh"
source "$SCRIPT_DIR/utils/write_to_file.sh"

# Функция помощи, выводит доступные флаги
help() {
  echo "Available flags:"
  echo "- D : Get directory structure"
  echo "- N : Get network information"
  echo "- S : Get system information"
  echo "- U : Get user information"
}

# Основная функция для обработки флагов и вызова функций
get_directory_context() {
  local flags="${1:-$DEFAULT_FLAGS}" 
  local output=""

  for flag in $(echo "$flags" | fold -w1); do
    case $flag in
      D) output+=$(get_directory_structure);;
      N) output+=$(get_network_info);;
      S) output+=$(get_system_info);;
      U) output+=$(get_user_info);;
      *) 
        echo "Error: Invalid flag: $flag"
        help
        return 1
        ;;
    esac
  done

  output=$(clean_string "$output")
  write_to_file "$OUTPUT_FILE" "$output"
}

# Основная функция вызова с передачей флага
cats() {
  get_directory_context "$1"
}

cats "$@"