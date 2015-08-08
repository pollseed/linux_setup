
# add user
sudo adduser shn

# add permission
sudo usermod -G sudo shn
su -shn
sudo reboot

# can use root user
sudo passwd root
su -

vi /etc/pam.d/su
#L.15 group=adm

usermod -G adm shn

# ntp
sudo apt-get -y install ntp

vi /etc/ntp.conf
/etc/init.d/ntp restart

# auto service
sudo apt-get -y install sysv-rc-conf
sysv-rc-conf --list
sysv-rc-conf ntp on

