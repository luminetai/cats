#!/bin/bash

get_system_info() {
  local os_name kernel_version cpu_info memory_info disk_info hostname
  local system_info

  # Получаем информацию о системе
  os_name=$(uname -s)  # Операционная система
  kernel_version=$(uname -r)  # Версия ядра
  cpu_info=$(lscpu | grep 'Model name' | sed 's/Model name: *//')  # Информация о процессоре
  memory_info=$(free -h | grep Mem | awk '{print $2}')  # Оперативная память
  disk_info=$(df -h / | grep / | awk '{print $2}')  # Свободное место на корневом диске
  hostname=$(hostname)  # Имя хоста

  # Формируем вывод в требуемом формате
  system_info="{os_name:{kernel_version:{cpu_info,memory_info,disk_info},hostname}}"
  
  # Заменяем переменные на соответствующие значения
  system_info="${system_info//os_name/$os_name}"
  system_info="${system_info//kernel_version/$kernel_version}"
  system_info="${system_info//cpu_info/$cpu_info}"
  system_info="${system_info//memory_info/$memory_info}"
  system_info="${system_info//disk_info/$disk_info}"
  system_info="${system_info//hostname/$hostname}"

  echo "{get_system_info:$system_info}"
}