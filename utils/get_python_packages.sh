#!/bin/bash

get_python_packages() {
  local packages package_list package_info

  # Получаем список установленных библиотек в формате "package==version"
  packages=$(pip list --format=freeze)

  # Преобразуем список в требуемый формат
  package_list=""
  while IFS= read -r package; do
    name=$(echo "$package" | cut -d= -f1)
    version=$(echo "$package" | cut -d= -f2)
    package_list+="$name:$version,"
  done <<< "$packages"

  # Убираем последнюю запятую
  package_list="${package_list%,}"

  # Формируем JSON-подобный вывод
  package_info="{installed_packages:{$package_list}}"
  
  echo "{get_python_packages:$package_info}"
}