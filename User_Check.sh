#!/bin/bash

user_count=0

for dir in /home/*; do
    if [ -d "$dir" ]; then
        username=$(basename "$dir")
        if id -u "$username" >/dev/null 2>&1; then
            echo "用户 $username 存在"
            ((user_count++))
        fi
    fi
done

echo "共有 $user_count 个用户存在"
