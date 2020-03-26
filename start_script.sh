######## This script will install everything needed ##############

#Must run with root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Install lib to run javascript 
apt-get install libc6-i386

