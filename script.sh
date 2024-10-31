echo Make sure to systemctl list-units --type=service --state=active
echo Check for anything suspicious
apt install git -y
# Basic Essentials
echo Password requirements
sed -i.bak '/password.*pam_unix.so/s/$/ minlen=8/' /etc/pam.d/common-password
echo Minimum Length Set
sed -i.bak '/auth.*pam_unix.so/s/ nullok//' /etc/pam.d/common-auth
echo Disabled Nullok Login
sed -i.bak '/PASS_MIN_AGE  0/PASS_MIN_AGE  2/' /etc/login.defs
sed -i.bak '/PASS_MAX_AGE  99999/PASS_MAX_AGE  90/' /etc/login.defs
sed -i.bak '/PASS_WARN_DAY  7/PASS_WARN_DAY  14/' /etc/login.defs
echo Changed password Age Requirements
sed -i.bak 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
echo Disabled SSH Root Login
locate '*.mp3'
locate '*.mp4'
echo Delete any mp3, mp4, jpeg files. Check readme first.
echo Check all files located.
echo Working on UFW
#UFW
ufw enable
ufw logging high
ufw default deny incoming
ufw default allow outgoing

ufw allow ssh
ufw deny telnet
ufw deny 2049
ufw deny 515
ufw deny 111
echo UFW Secured

#Enable Account Lockout Policy
cd /usr/share/pam-configs
wget https://raw.githubusercontent.com/ayulovesyou/Cybersecurity/refs/heads/main/faillock_notify
wget https://raw.githubusercontent.com/ayulovesyou/Cybersecurity/refs/heads/main/faillock
cd /

#More Advanced Shit
sed -i 's/net\.ipv4\.tcp_syncookies=1/net\.ipv4\.tcp_syncookies=0/' /etc/sysctl.conf
echo IPv4 TCP SYN cookies enabled
sed -i 's/net\.ipv4\.ip_forward=1/net\.ipv4\.ip_forward=0/' /etc/sysctl.conf
echo Diable IPv4 IP Forwarding
sysctl --system > /dev/null
chmod 640 /etc/shadow
echo Changed permissions on /etc/shadow
systemctl disable --now nginx
systemctl disable --now apache2
systemctl disable --now vsftpd
echo Disabled known vulnerable services, Nginx, Apache, FTP
apt purge aisleriot
apt autoremove -y
echo disable aisleriot
apt autoremove -y
pkill -f nc.traditional
rm /usr/bin/nc.traditional

echo Please run "pam-auth-update" and enable "Notify on failed login attempts" and "Enforce failed login attempt counter"
echo Also run "Sudo ss -tlnp"
echo Make sure to systemctl list-units --type=service --state=active
echo Check for anything suspicious
echo Delete any mp3, mp4, jpeg files. Check readme first.
