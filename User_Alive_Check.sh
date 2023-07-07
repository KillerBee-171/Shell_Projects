#!/bin/bash

user_count=0

for user in $(cut -d: -f1 /etc/passwd); do
    if who | grep -wq "$user"; then
        echo "用户 $user 是存活的"
        ((user_count++))
    fi
done

echo "共有 $user_count 个用户存活"
