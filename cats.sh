#!/bin/bash

OUTPUT_FILE=".cats"
DEFAULT_FLAGS="dsnupa"

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
source "$SCRIPT_DIR/utils/get_python_packages.sh"
source "$SCRIPT_DIR/utils/write_to_file.sh"
source "$SCRIPT_DIR/utils/get_installed_packages.sh"

# Функция помощи
help() {
  echo "Available flags:"
  echo "-d, --directory          : Get directory structure"
  echo "-n, --network            : Get network information"
  echo "-s, --system             : Get system information"
  echo "-u, --user               : Get user information"
  echo "-p, --python-packages    : Get installed Python packages"
  echo "-a, --all-packages       : Get all installed packages (APT, Snap, Flatpak, etc.)"
  echo "-h, --help               : Show help"
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
      p) output+=$(get_python_packages);;
      a) output+=$(get_installed_packages);;
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
      -d|--directory) input_flags+="d" ;;
      -n|--network) input_flags+="n" ;;
      -s|--system) input_flags+="s" ;;
      -u|--user) input_flags+="u" ;;
      -p|--python-packages) input_flags+="p" ;;
      -a|--all-packages) input_flags+="a" ;;
      -h|--help) help; return 0 ;;
      -*) input_flags+="${1:1}" ;;
      --*) echo "Error: Invalid flag: $1"; help; return 1 ;;
      *) echo "Error: Invalid argument: $1"; help; return 1 ;;
    esac
    shift
  done
  
  get_directory_context "${input_flags:-$DEFAULT_FLAGS}"
}

cats "$@"