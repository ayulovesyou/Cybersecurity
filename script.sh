echo Make sure to systemctl list-units --type=service --state=active
echo Check for anything suspicious
# Basic Essentials
echo Password requirements
sudo sed -i '/password.*pam_unix.so/s/$/ minlen=8/' /etc/pam.d/common-password
echo Minimum Length Set
sudo sed -i '/auth.*pam_unix.so/s/ nullok//' /etc/pam.d/common-auth
echo Disabled Nullok Login
sudo sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
echo Disabled SSH Root Login
sudo ufw enable
echo Enabled UFW
locate '*.mp3'
locate '*.mp4'
echo Delete any mp3, mp4, jpeg files. Check readme first.

#More Advanced Shit
sudo sed -i 's/net.ipv4.tcp_syncookies=1/net.ipv4.tcp_syncookies=0' /etc/sysctl.conf
echo IPv4 TCP SYN cookies enabled
sudo sed -i 's/net.ipv4.ip_forward=1/net.ipv4.ip_forward=0'
echo Diable IPv4 IP Forwarding
sudo chmod 640 /etc/shdow
echo Changed permissions on /etc/shadow
sudo systemctl disable --now nginx
sudo systemctl disable --now apache2
sudo systemctl disable --now vsftpd
echo Disabled known vulnerable services, Nginx, Apache, FTP
sudo apt purge aisleriot
sudo apt autoremove -y

