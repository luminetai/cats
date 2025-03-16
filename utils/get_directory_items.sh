#!/bin/bash

get_directory_items() {
  local dir="$1"
  items_array=()
  if ! shopt -s nullglob; then
    echo "Error activating nullglob." >&2
    return 1
  fi
  items_array=("$dir"/*)
  shopt -u nullglob
}