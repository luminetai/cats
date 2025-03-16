#!/bin/bash

get_network_info() {
  local interfaces routes dns_info network_info

  # Получаем информацию о сетевых интерфейсах
  interfaces=$(ip -o link show | awk -F': ' '{print $2}')  # Список всех интерфейсов

  # Получаем информацию о маршрутах
  routes=$(ip route show)  # Список маршрутов

  # Получаем информацию о DNS
  dns_info=$(grep '^nameserver' /etc/resolv.conf | awk '{print $2}')  # DNS-серверы

  # Формируем вывод в требуемом формате
  network_info="{interfaces:{bridges:{routes,dns_info}}}"

  # Заменяем переменные на соответствующие значения
  network_info="${network_info//interfaces/$interfaces}"
  network_info="${network_info//bridges/}"  # Удаляем bridges, так как мы больше не используем их
  network_info="${network_info//routes/$routes}"
  network_info="${network_info//dns_info/$dns_info}"

  echo "{get_network_info:$network_info}"
}