#!/bin/bash

get_directory_structure() {
  declare -a stack indices counts items_array
  local output=""
  local old_idx
  local current_dir current_item
  local name perm fileContent

  stack+=(".")
  indices+=(0)
  get_directory_items "."
  counts+=(${#items_array[@]})
  
  output="{"

  while [ ${#stack[@]} -gt 0 ]; do
    current_dir="${stack[${#stack[@]}-1]}"
    idx="${indices[${#indices[@]}-1]}"
    total="${counts[-1]}"
    depth=${#stack[@]}

    if [ $idx -ge $total ]; then
      output+="}"
      stack=("${stack[@]:0:${#stack[@]}-1}")
      indices=("${indices[@]:0:${#indices[@]}-1}")
      counts=("${counts[@]:0:${#counts[@]}-1}")
      if [ ${#indices[@]} -gt 0 ]; then
        parent_total="${counts[-1]}"
        parent_idx="${indices[-1]}"
        if [ $parent_idx -lt $parent_total ]; then
          output+=","
        fi
      fi
      continue
    fi

    old_idx="$idx"
    get_directory_items "$current_dir"
    current_items=(${items_array[@]})
    current_item="${current_items[$idx]}"
    indices[-1]=$(( idx + 1 ))

    name=$(basename "$current_item")
    perm=$(stat -c "%A" "$current_item" 2>/dev/null)
    if [ -z "$perm" ]; then
      perm="?????????"
    fi

    if [ -d "$current_item" ]; then
      output+="${name}:${perm}{"
      stack+=("$current_item")
      indices+=(0)
      get_directory_items "$current_item"
      counts+=(${#items_array[@]})
    elif [ -f "$current_item" ]; then
      output+="${name}:${perm}{"
      fileContent=$(get_file_contents "$current_item" 2>/dev/null)
      fileContent=$(clean_string "$fileContent")
      output+="${fileContent}"
      output+="}"
      if [ $old_idx -lt $(( total - 1 )) ]; then
        output+=","
      fi
    fi
  done

  output+="}"
  echo -e "{get_directory_structure:$output}"
}