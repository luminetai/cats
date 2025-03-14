#!/bin/bash

# Скачать и установить зависимости
install_dependencies() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Установка xclip для Linux
    echo "Installing xclip on Linux..."
    sudo apt-get update
    sudo apt-get install -y xclip
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Установка pbcopy для macOS
    echo "Installing pbcopy on macOS..."
    brew install pbcopy
  else
    echo "Unsupported OS. Only Linux and macOS are supported."
    exit 1
  fi
}

# Установка скрипта cats
install_cats() {
  echo "Installing cats script..."
  sudo curl -fsSL https://raw.githubusercontent.com/luminetai/cats/main/cats.sh -o /usr/local/bin/cats
  sudo chmod +x /usr/local/bin/cats
  echo "cats successfully installed!"
}

# Основная установка
main_install() {
  # Установка зависимостей
  install_dependencies
  
  # Установка cats
  install_cats
}

# Выполнение всего процесса
main_install
