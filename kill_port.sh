#!/bin/bash

# 輸入要結束的port號
read -p "請輸入要結束的port號: " port

# 檢查port是否被佔用並取得相關PID
pids=$(lsof -n -i:"$port" | grep LISTEN | awk '{print $2}')

if [ -z "$pids" ]; then
  echo "Port $port 並未被使用."
else
  echo "正在結束佔用 Port $port 的進程..."
  for pid in $pids; do
    kill "$pid"
  done
  echo "進程已結束."
fi
