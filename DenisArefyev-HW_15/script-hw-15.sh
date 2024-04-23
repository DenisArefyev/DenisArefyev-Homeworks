#!/bin/bash
OUT_DIR="/users/denisarefyev/documents/ICH-GitWork/TMP"
#
write_info() {
    echo "$(date +"%H:%M:%S") $(ps -ef | wc -l)" >> $OUT_DIR/info.txt
}
#
mkdir -p $OUT_DIR
cat /proc/cpuinfo > processor_info.txt
cat /etc/os-release | grep '^NAME=' | awk -F '=' '{print $2}' > $OUT_DIR/os_info.txt
cat /etc/os-release | grep '^NAME=' | awk -F '=' '{print $2}' | tr -d '"' > $OUT_DIR/os_info_clean.txt
#
for i in {50..100}; do
    touch "$OUT_DIR/${i}.txt"
done
#
for j in {1..10}; do
    write_info
    sleep 1
done
#

