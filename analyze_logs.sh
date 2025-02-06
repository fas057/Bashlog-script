#!/bin/bash

# Подсчитываем общее количество запросов
total_requests=$(cat access.log | wc -l)

# Подсчитываем количество уникальных IP-адресов
unique_ips=$(awk '{print $1}' access.log | sort | uniq | wc -l)

# Подсчитываем количество запросов по методам (GET, POST)
get_requests=$(grep '"GET' access.log | wc -l)
post_requests=$(grep '"POST' access.log | wc -l)

# Находим самый популярный URL
popular_url=$(awk '{print $7}' access.log | sort | uniq -c | sort -nr | head -n 1)

# Создаем отчет в виде текстового файла report.txt
echo "Всего запросов: $total_requests" > report.txt
echo "Уникальные адреса: $unique_ips" >> report.txt
echo "GET-запросов, шт.: $get_requests" >> report.txt
echo "POST-запросов, шт.: $post_requests" >> report.txt
echo "Самый популярный URL: $popular_url" >> report.txt

# Выводим отчет в терминал
cat report.txt

