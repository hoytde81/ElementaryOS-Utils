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
apt-get install -y software-properties-common

#Install chrome
apt-get install -y libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome*.deb
apt-get install -y -f
dpkg -i google-chrome*.deb
rm -f google-chrome*.deb

# Install lib to run javascript 
apt-get install -y libc6-i386
# Install qemu-kvm to use Android Emu
apt-get install -y qemu-kvm
adduser $USER kvm

# Show all system tray icon && remove duplicate wifi
add-apt-repository ppa:yunnxx/elementary -y
apt update
apt-get install -y indicator-application wingpanel-indicator-ayatana
sed -i -e 's/OnlyShowIn=Unity;GNOME;/OnlyShowIn=Unity;GNOME;Pantheon;/g' /etc/xdg/autostart/indicator-application.desktop
rm -f /etc/xdg/autostart/nm-applet.desktop

###################### Util Field ############################
# use md5 as md5sum
cd $(dirname $(which md5sum))
cp md5sum md5

# Replace new plank with old plank have zoom feature.
add-apt-repository ppa:ricotz/docky -y
apt-get update
cd /etc/apt/preferences.d/
touch planky.pref
echo "Package: *" >> planky.pref
echo "Pin: release o=LP-PPA-ricotz-docky" >> planky.pref
echo "Pin-Priority: 1001" >> planky.pref
apt-get update
apt-get install -y plank

# Install git
apt-get install -y git

# Install vim
apt-get install -y vim

# Beautiful git
git config --global alias.lg "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
git config --global alias.lg2 "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

