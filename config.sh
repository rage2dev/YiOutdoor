udhcpc -i wlan0 -b -s /backup/script/default.script &
sleep 10
/bin/busybox telnetd -l/bin/ash -p9999 &
