#!/bin/bash

# 设置阈值（百分比）
threshold=70
# 设置收件人邮箱
recipient="a13699501596@hotmail.com"

while true; do
    # 获取当前CPU使用率
    cpu_usage=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2}' | awk -F. '{print $1}')

    # 检查CPU使用率是否超过阈值
    if [ $cpu_usage -gt $threshold ]; then
        echo "CPU 使用率超过阈值！当前使用率: $cpu_usage%"

        # 发送邮件通知
        echo "Subject: CPU 使用率警报" > /tmp/email.txt
        echo "CPU 使用率已超过阈值！当前使用率: $cpu_usage%" >> /tmp/email.txt
        msmtp -a default $recipient < /tmp/email.txt

        # 在此处可以添加其他适当的操作

    else
        echo "CPU 使用率正常。当前使用率: $cpu_usage%"
    fi

    # 延迟5秒
    sleep 5
done
