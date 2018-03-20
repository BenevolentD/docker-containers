export DISPLAY=:0
wname="sample wine app"

su -c "chown nobody -R /home/nobody" root

if [ -f "~/firstran" ]
then
    echo "[$wname]: Using previous configuration."
else
	echo "[$wname]: First run configuration."
    passw=$(pwgen 8)
    echo "[$wname]: VNC password: $passw"
    mkdir ~/.vnc
    echo "$passw" | vncpasswd -f > ~/.vnc/passwd
    winetricks -q settings windowmanagerdecorated=n windowmanagermanaged=n
    touch ~/firstran
fi
while :
do
	echo "[$wname]: Starting."
    Xvfb -screen 0 1024x768x16 &
    sleep 2
    x0vncserver -display $DISPLAY -passwordfile ~/.vnc/passwd -rfbport 5900 &
    wine notepad.exe
	#wine /WiiUUSBHelper/Updater.exe
    killall x0vncserver
    killall xvfb
done
echo "[$wname]: Exiting."```