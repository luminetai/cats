#!/bin/bash

get_python_packages() {
  local packages package_list

  # Путь к виртуальному окружению
  VENV_DIR="./venv"

  # Проверяем, существует ли виртуальное окружение
  if [[ ! -d "$VENV_DIR" || ! -f "$VENV_DIR/bin/activate" ]]; then
    # Если виртуальное окружение не найдено, возвращаем пустой JSON
    echo "{get_python_packages:{}}"
    exit 0
  fi

  # Активируем виртуальное окружение
  source "$VENV_DIR/bin/activate"

  # Получаем список установленных пакетов через pip freeze
  packages=$(pip freeze)

  # Инициализируем переменную для списка пакетов
  package_list=""

  # Преобразуем список в требуемый формат
  while IFS= read -r package; do
    package_list+="${package//==/:},"
  done <<< "$packages"

  # Убираем последнюю запятую и выводим результат
  echo "{get_python_packages:{$package_list%,}}"

  # Деактивируем виртуальное окружение
  deactivate 2>/dev/null
}