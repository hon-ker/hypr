#!/bin/bash

# 获取IPv4地址
ip=$(ip -4 address show | grep inet | grep -v '127.0.0.1' | awk '{print $2}' | cut -d'/' -f1 | head -n 1)
trimmed_ip=$(echo "$ip" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

# 复制到wl-copy
printf "$trimmed_ip" | wl-copy


# 输出结果
notify-send "IP addr:" "$trimmed_ip"
