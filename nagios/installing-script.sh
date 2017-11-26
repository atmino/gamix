#setup monitor service
#van https://support.nagios.com/kb/article/nagios-core-installing-nagios-core-from-source.html#Ubuntu
#Nagios CORE
#installeren van prerequisites
apt-get install -y autoconf gcc libc6 make wget unzip apache2 php libapache2-mod-php7.0 libgd2-xpm-dev

#downloaden van de source naar /tmp
cd /tmp
wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.3.4.tar.gz
tar xzf nagioscore.tar.gz

#source compileren, we gebruiken een apache2 server voor de webinterface
cd /tmp/nagioscore-nagios-4.3.4/
./configure --with-httpd-conf=/etc/apache2/sites-enabled
make all

#toevoegen van nagios user, en aan groep nagios en www-data
useradd nagios
usermod --shell /bin/bash nagios
usermod -aG nagios www-data

make install
make install-init
update-rc.d nagios defaults
make install-commandmode
make install-config

#de configuratie voor apache2
make install-webconf
a2enmod rewrite
a2enmod cgi

#laat Apache door de firewall
ufw allow Apache
ufw reload

#nagios user aanmaken in apache (s3 privilege)
htpasswd -c -b /usr/local/nagios/etc/htpasswd.users nagiosadmin porkI9SwSmdQHv9AQmxD

systemctl restart apache2.services
systemctl start nagios.service


#installeer nagios plugins
#prereqs
apt-get install -y autoconf gcc libc6 libmcrypt-dev make libssl-dev wget bc gawk dc build-essential snmp libnet-snmp-perl gettext

#download source naar tmp, unpack
cd /tmp
wget --no-check-certificate -O nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz
tar zxf nagios-plugins.tar.gz

#navigeer naar folder, configureer en installeer
cd /tmp/nagios-plugins-release-2.2.1/
./tools/setup
./configure
make
make install

#configureer waar de config vandaan wordt gehaald
mkdir /usr/local/nagios/etc/servers
sed -i -e 's|#cfg_dir=/usr/local/nagios/etc/nagios.cfg|cfg_dir=/usr/local/nagios/etc/servers|' /usr/local/nagios/etc/nagios.cfg

#herstart de service
systemctl restart nagios.service