#!/bin/bash

get_user_info() {
  local user_name user_id user_groups user_home user_shell user_info

  user_name=$(whoami)
  user_id=$(id -u)
  user_groups=$(id -Gn)
  user_home=$(eval echo ~$user_name)
  user_shell=$(getent passwd "$user_name" | cut -d: -f7)
  user_info=$(getent passwd "$user_name" | cut -d: -f5)
  user_info="{user_name:{user_id:{user_groups,user_home,user_shell,user_info}}}"

  user_info="${user_info//user_name/$user_name}"
  user_info="${user_info//user_id/$user_id}"
  user_info="${user_info//user_groups/$user_groups}"
  user_info="${user_info//user_home/$user_home}"
  user_info="${user_info//user_shell/$user_shell}"
  user_info="${user_info//user_info/$user_info}"

  echo "{get_user_info:$user_info}"
}
