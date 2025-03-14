#!/bin/bash

# Функция для установки зависимостей в зависимости от операционной системы
install_dependencies() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Для Linux устанавливаем xclip
    echo "Linux detected. Installing xclip..."
    sudo apt-get update
    sudo apt-get install -y xclip
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Для macOS устанавливаем pbcopy
    echo "macOS detected. Installing pbcopy..."
    brew install pbcopy
  else
    echo "Error: Unsupported OS. Only Linux and macOS are supported."
    exit 1
  fi
}

# Функция для установки скрипта cats
install_cats() {
  echo "Installing cats script..."

  # Скачиваем cats.sh в /usr/local/bin
  sudo curl -fsSL https://raw.githubusercontent.com/luminetai/cats/main/cats.sh -o /usr/local/bin/cats

  # Делаем файл исполнимым
  sudo chmod +x /usr/local/bin/cats

  echo "cats installed successfully. You can now use the 'cats' command."
}

# Основная функция установки
main_install() {
  # Устанавливаем зависимости
  install_dependencies

  # Устанавливаем cats
  install_cats
}

# Запуск основной функции
main_install
