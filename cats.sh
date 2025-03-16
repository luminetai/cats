#!/bin/bash

OUTPUT_FILE=".cats"
DEFAULT_FLAGS="dsnu"

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

# Функция помощи
help() {
  echo "Available flags:"
  echo "-d, --directory    : Get directory structure"
  echo "-n, --network      : Get network information"
  echo "-s, --system       : Get system information"
  echo "-u, --user         : Get user information"
  echo "-h, --help         : Show help"
}

# Разбор аргументов
get_directory_context() {
  local flags="${1:-$DEFAULT_FLAGS}"
  local output=""

  for (( i=0; i<${#flags}; i++ )); do
    case "${flags:$i:1}" in
      d) output+=$(get_directory_structure);;
      n) output+=$(get_network_info);;
      s) output+=$(get_system_info);;
      u) output+=$(get_user_info);;
      h) help; return 0;;
      *) 
        echo "Error: Invalid flag: ${flags:$i:1}"
        help
        return 1
        ;;
    esac
  done

  output=$(clean_string "$output")
  write_to_file "$OUTPUT_FILE" "$output"
}

# Основная функция вызова с флагами
cats() {
  local input_flags=""
  
  while [[ $# -gt 0 ]]; do
    case "$1" in
      -*) input_flags+="${1:1}";;
      --*) ;; # Игнор длинных флагов, если не обрабатываются
      *) echo "Error: Invalid argument: $1"; help; return 1;;
    esac
    shift
  done
  
  get_directory_context "${input_flags:-$DEFAULT_FLAGS}"
}

cats "$@"
