echo Make sure to systemctl list-units --type=service --state=active
echo Check for anything suspicious
apt install git net-tools libpam-cracklib open-vm-tools -y
mkdir -p ~/Desktop/backups
chmod 777 ~/Desktop/backups


# Basic Essentials
echo Password requirements
sed -i.bak '/password.*pam_unix.so/s/$/ minlen=8/' /etc/pam.d/common-password
echo Minimum Length Set
sed -i.bak '/auth.*pam_unix.so/s/ nullok//' /etc/pam.d/common-auth
echo Disabled Nullok Login
sed -i.bak 's/PASS_MIN_AGE  0/PASS_MIN_AGE  2/' /etc/login.defs
sed -i.bak 's/PASS_MAX_AGE  99999/PASS_MAX_AGE  90/' /etc/login.defs
sed -i.bak 's/PASS_WARN_DAY  7/PASS_WARN_DAY  14/' /etc/login.defs
echo Changed password Age Requirements
sed -i.bak 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
echo Disabled SSH Root Login
echo Delete any mp3, mp4, jpeg files. Check readme first.
echo Check all files located.

#UFW
echo Working on UFW
ufw enable
ufw logging high > /dev/null
ufw default deny incoming > /dev/null
ufw default allow outgoing > /dev/null
ufw allow ssh > /dev/null
ufw deny telnet > /dev/null
ufw deny 2049 > /dev/null
ufw deny 515 > /dev/null
ufw deny 111 > /dev/null
echo UFW Secured

#Enable Account Lockout Policy
cd /usr/share/pam-configs
wget https://raw.githubusercontent.com/ayulovesyou/Cybersecurity/refs/heads/main/faillock_notify > /dev/null
wget https://raw.githubusercontent.com/ayulovesyou/Cybersecurity/refs/heads/main/faillock > /dev/null
cd /

#More Advanced Shit
sed -i 's/net\.ipv4\.tcp_syncookies=1/net\.ipv4\.tcp_syncookies=0/' /etc/sysctl.conf
echo IPv4 TCP SYN cookies enabled
sed -i 's/net\.ipv4\.ip_forward=1/net\.ipv4\.ip_forward=0/' /etc/sysctl.conf
echo Disabled IPv4 IP Forwarding
sysctl --system > /dev/null
chmod 640 /etc/shadow > /dev/null
echo Changed permissions on /etc/shadow
systemctl disable --now nginx > /dev/null
systemctl disable --now apache2 > /dev/null
systemctl disable --now vsftpd > /dev/null
systemctl disable --now ssh > /dev/null
echo Disabled known vulnerable services, Nginx, Apache, FTP
apt remove wireshark transmission-gtk ophcrack freeciv aircrack-ng samba samba-common samba-common-bin samba4 -y
apt remove telnet telnetd inetutils-telnetd telnetd-ssl bind9 -y
apt purge netcat netcat-openbsd netcat-traditional ncat pnetcat socat sock socket sbd -y
apt purge hydra hydra-gtk aircrack-ng fcrackzip lcrack ophcrack ophcrack-cli pdfcrack pyrit john john-data -y
apt purge rarcrack sipcrack irpas logkeys zeitgeist-core zeitgeist-datahub python-zeitgeist rhythmbox-plugin-zeitgeist zeitgeist -y
apt purge nfs-kernel-server nfs-common portmap rpcbind autofs nginx nginx-common -y
apt purge inetd openbsd-inted xinetd inetutils-ftp inetutils-ftpd inetutils-inetd inetutils-ping inetutils-syslogd inetutils-talk inetutils-talkd inetutils-telnet inetutils-telnetd inetutils-tools inetutils-traceroute -y
apt purge vnc4server nvcsnapshot vtgrab snmp -y
echo Revoved Unwanted Programs. & Removed backdoors
apt purge aisleriot -y
apt autoremove -y > /dev/null
pkill -f nc.traditional > /dev/null
rm /usr/bin/nc.traditional > /dev/null

#More scripting shit
crontab -l > ~/Desktop/backups/crontab-old
crontab -r
echo "Crontab backed up and startup tasks disabled."

echo Please run "pam-auth-update" and enable "Notify on failed login attempts" and "Enforce failed login attempt counter"
echo Also run "Sudo ss -tlnp"
echo Make sure to systemctl list-units --type=service --state=active
echo Check for anything suspicious
locate '*.mp3' | xargs rm
locate '*.mp4' | xargs rm
locate '*.jpeg' | xargs rm
echo Delete any mp3, mp4, jpeg files. Check readme first.
echo Select new passwords for any insecure passwords.
echo Update Google Chrome, enable Security Options to Max. Go to settings, turn on automatic updates. 
echo Remove Guest user, run "Sudo nano /etc/lightdm/lightdm.conf" and change allow-guest to false.
