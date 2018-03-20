#!/usr/bin/bash

if [ ! -e "/root/usbhelper_installed" ] ; then
    cd /root/wiiuusbhelper
    wget https://application.wiiuusbhelper.com/Updater.exe
    touch "/root/usbhelper_installed"
fi

wine "/root/wiiuusbhelper/Updater.exe"
