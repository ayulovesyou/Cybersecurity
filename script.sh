echo Make sure to systemctl list-units --type=service --state=active
echo Check for anything suspicious
# Basic Essentials
echo Password requirements
sed -i '/password.*pam_unix.so/s/$/ minlen=8/' /etc/pam.d/common-password
echo Minimum Length Set
sed -i '/auth.*pam_unix.so/s/ nullok//' /etc/pam.d/common-auth
echo Disabled Nullok Login
sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
echo Disabled SSH Root Login
ufw enable
echo Enabled UFW
locate '*.mp3'
locate '*.mp4'
echo Delete any mp3, mp4, jpeg files. Check readme first.

#More Advanced Shit
sed -i 's/net.ipv4.tcp_syncookies=1/net.ipv4.tcp_syncookies=0' /etc/sysctl.conf
echo IPv4 TCP SYN cookies enabled
sed -i 's/net.ipv4.ip_forward=1/net.ipv4.ip_forward=0'
echo Diable IPv4 IP Forwarding
chmod 640 /etc/shdow
echo Changed permissions on /etc/shadow
systemctl disable --now nginx
systemctl disable --now apache2
systemctl disable --now vsftpd
echo Disabled known vulnerable services, Nginx, Apache, FTP
apt purge aisleriot
apt autoremove -y
