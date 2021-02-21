#!/bin/bash

database_address=${database_address}
database_port=${database_port}
server_text=${server_text}

yum update -y
amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
yum install -y httpd mariadb-server
systemctl start httpd
systemctl enable httpd
usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www
chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
cat > /var/www/html/index.html <<EOF
<h1>${server_text}</h1>
<p>DB address: ${database_address}</p>
<p>DB port: ${database_port}</p>
EOF
echo "welcome to my server DB_INSTANCE: ${database_address} DB_PORT: ${database_port}" >> /var/www/html/index.html