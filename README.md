# YiOutdoor

	Starting with FirmwareVersion 7.1.00.19A_201910181012, Yi has disabled the default telnetd and !!serial/tty!! 

	Solution? -> I dumped the SPI/Flash and had a bit of binwalk fun :) 

# Bootlogic
	On boot YiCam will check if there is a file called "factory_test.sh" in "sdroot/Factory/"
	factory_test.sh will start config.sh in the same folder.

	Problem -> "./dispatch" looks for "sdroot/Factory/factory_test.sh" and dont bring up WLAN0 if it exists. 

# Solution
	./jffs2-root/fs_1/script/wifidhcp.sh looks for "sdroot/wifi/config.sh" and will execute it. 

	So we create the file wifi/config.sh.

# config.sh
	udhcpc -i wlan0 -b -s /backup/script/default.script &
	sleep 10
	/bin/busybox telnetd -l/bin/ash -p9999 &
  
# How to flash new firmware
  The Cam is looking for /tmp/sd/home_r10m on boot and will flash it if it exists
