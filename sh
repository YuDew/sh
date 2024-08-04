#!/bin/bash
GITHUB_COMMIT_URL="https://github.com/YuDew/oriid/blob/main/ID"

curl -s "$GITHUB_COMMIT_URL" | grep -o -E '[0-9]+' > numbers.txt

SYS_SERIAL=$(cat /sys/devices/soc0/serial_number)

if grep -Fxq "$SYS_SERIAL" numbers.txt; then
    echo "验证通过"
else
    echo "失败"
fi

rm numbers.txt
