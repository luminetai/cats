#!/bin/bash

# Функция для установки зависимостей
install_dependencies() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Для Linux можно оставить только базовые утилиты, если они требуются.
    echo "No dependencies needed for Linux."
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Для macOS, если ничего не нужно, просто выводим сообщение.
    echo "No dependencies needed for macOS."
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
