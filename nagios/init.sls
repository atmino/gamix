#install nagioscore and plugins

extract-nagios:
  archive.extracted:
    - name: /tmp
    - source: salt://nagios/nagios.tar.gz
    - source_hash: b345bf474bf4f9b9c63fd38e0576abc37b9debe655c0071017c95d59d22eb31e
    - source_hash_update: True
    - options: z

nagios-prereqs:
  cmd.run:
    - name:
        apt-get install -y autoconf gcc libc6 make wget unzip apache2 php libapache2-mod-php7.0 libgd2-xpm-dev
    - shell: /bin/bash

#TODO: update to use pillar
install-nagios:
  cmd.run:
    - name:
        cd /tmp/nagios
        ./configure --with-httpd-conf=/etc/apache2/sites-enabled
        make all
        useradd nagios
        usermod -aG nagios www-data
        make install
        make install-init
        update-rc.d nagios defaults
        make install-commandmode
        make install-configure
        make install-webconf
        a2enmod rewrite
        a2enmod cgi
        ufw allow Apache
        ufw reload
        htpasswd -c -b /usr/local/nagios/etc/htpasswd.users nagiosadmin porkI9SwSmdQHv9AQmxD
        systemctl restart apache2.services
        systemctl start nagios.service
      - cwd: tmp/nagios
      - shell: /bin/bash
      - unless: test -x /usr/local/nagios