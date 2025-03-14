#!/bin/bash

# Функция для установки зависимостей
install_dependencies() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Установка зависимостей для Linux
    echo "Installing dependencies for Linux..."
    sudo apt-get update
    sudo apt-get install -y xclip xsel
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Установка зависимостей для macOS
    echo "Installing dependencies for macOS..."
    brew install pbcopy
  else
    echo "Unsupported OS. Only Linux and macOS are supported."
    exit 1
  fi
}

# Функция для установки скрипта cats
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
