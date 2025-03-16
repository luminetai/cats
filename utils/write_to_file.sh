#!/bin/bash

write_to_file() {
  local file="$1"
  local content="$2"

  if [ ! -f "$file" ]; then
    touch "$file"
  fi
  echo -e "$content" > "$file"
}