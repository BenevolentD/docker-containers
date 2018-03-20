#!/usr/bin/bash

if [ ! -e "/root/usbhelper_installed" ] ; then
    cd /root/wiiuusbhelper
    sh winetricks -q msxml3 dotnet45 vcrun2010 win7 && \
    wget https://application.wiiuusbhelper.com/Updater.exe
    touch "/root/usbhelper_installed"
fi

wine "/root/wiiuusbhelper/Updater.exe"
