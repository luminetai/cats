#!/bin/bash

clean_string() {
  echo "$1" | awk '{gsub(/\x00/, ""); print}' | tr -s '[:space:]' ' ' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//'
}
