#!/bin/bash

get_python_packages() {
  local packages package_list name version

  # Получаем список установленных пакетов через pip freeze
  packages=$(pip freeze)

  # Инициализируем переменную для списка пакетов
  package_list=""

  # Преобразуем список в требуемый формат
  while IFS= read -r package; do
    # Заменяем "==" на ":" для нужного формата
    package_list+="${package//==/:},"
  done <<< "$packages"

  # Убираем последнюю запятую
  package_list="${package_list%,}"

  # Формируем вывод в нужном формате
  echo "{get_python_packages:{$package_list}}"
}