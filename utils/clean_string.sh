#!/bin/bash

clean_string() {
  echo "$1" | tr -s '[:space:]' ' ' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//'
}