#!/bin/bash

get_installed_packages() {
  local apt_packages snap_packages flatpak_packages pip_packages npm_packages gem_packages cargo_packages

  # Получаем список APT-пакетов
  apt_packages=$(dpkg --get-selections | awk '{print $1}')
  
  # Получаем список Snap-пакетов
  snap_packages=$(snap list 2>/dev/null | awk 'NR>1 {print $1}')
  
  # Получаем список Flatpak-пакетов
  flatpak_packages=$(flatpak list --columns=application 2>/dev/null | awk 'NR>1')
  
  # Получаем список pip-пакетов
  pip_packages=$(pip list --format=freeze 2>/dev/null)
  
  # Получаем список глобальных npm-пакетов
  npm_packages=$(npm list -g --depth=0 2>/dev/null | awk -F ' ' 'NR>1 {print $1}')
  
  # Получаем список gem-пакетов
  gem_packages=$(gem list --local 2>/dev/null | awk '{print $1}')
  
  # Получаем список cargo-пакетов
  cargo_packages=$(cargo install --list 2>/dev/null | awk '{print $1}')
  
  # Формируем JSON-структуру
  packages_info="{apt:[$(echo "$apt_packages" | sed 's/\(.*\)/"\1"/g' | tr '\n' ',')],"
  packages_info+="snap:[$(echo "$snap_packages" | sed 's/\(.*\)/"\1"/g' | tr '\n' ',')],"
  packages_info+="flatpak:[$(echo "$flatpak_packages" | sed 's/\(.*\)/"\1"/g' | tr '\n' ',')],"
  packages_info+="pip:[$(echo "$pip_packages" | sed 's/\(.*\)/"\1"/g' | tr '\n' ',')],"
  packages_info+="npm:[$(echo "$npm_packages" | sed 's/\(.*\)/"\1"/g' | tr '\n' ',')],"
  packages_info+="gem:[$(echo "$gem_packages" | sed 's/\(.*\)/"\1"/g' | tr '\n' ',')],"
  packages_info+="cargo:[$(echo "$cargo_packages" | sed 's/\(.*\)/"\1"/g' | tr '\n' ',')]}"

  # Убираем последнюю запятую
  packages_info="${packages_info//,]/]}"

  echo "{get_installed_packages:$packages_info}"
}