#!/bin/bash

clean_string() {
  # Удаляем нулевые байты с помощью awk, затем обрабатываем пробелы и обрезаем
  printf "%s" "$1" | awk '{gsub(/\x00/, ""); print}' | tr -s '[:space:]' ' ' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//'
}
