######## This script will install everything needed ##############

#Must run with root
if [ "$EUID" -ne 0 ];
  then echo "Please run as root"
  exit
fi

#Update apt list
apt-get update

################## Install Field ############################
#Install common
apt-get install software-properties-common

# Install lib to run javascript 
apt-get install libc6-i386

# Install qemu-kvm to use Android Emu
apt-get install qemu-kvm
adduser $USER kvm

# Show all system tray icon && remove duplicate wifi
add-apt-repository ppa:yunnxx/elementary
apt update
apt install indicator-application wingpanel-indicator-ayatana
sed -i -e 's/OnlyShowIn=Unity;GNOME;/OnlyShowIn=Unity;GNOME;Pantheon;/g' /etc/xdg/autostart/indicator-application.desktop
rm -f /etc/xdg/autostart/nm-applet.desktop

###################### Util Field ############################
# use md5 as md5sum
cd $(dirname $(which md5sum))
cp md5sum md5
