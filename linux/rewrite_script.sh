#!/bin/bash
cd
sudo apt update -y
echo "Update Done!"
echo ""
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo "Update Done!"
echo ""
# install maven
sudo DEBIAN_FRONTEND=noninteractive apt install maven -y
echo "Maven Install Done!"
echo ""
# check maven is installed
mvn -v
echo "Maven Check Done!"
echo ""
# install JDK (java) 17
sudo DEBIAN_FRONTEND=noninteractive apt install openjdk-17-jdk -y
echo "Installed JDK Done!"
echo ""
# check JDK 17 is installed
java -version
echo "Java Check Done!"
echo ""
# copy the app code to this VM
sudo DEBIAN_FRONTEND=noninteractive apt install git -y
echo "Git Install Done!"
rm -rf repo
git clone https://github.com/FThompsonSG/tech242-jsonvoorhees-app.git repo
echo "Git Clone Done!"
 
# Install Apache
sudo DEBIAN_FRONTEND=noninteractive apt install apache2 -y
 
sudo systemctl start apache2
sudo systemctl enable apache2
 
# Enable necessary Apache modules
sudo a2enmod proxy
sudo a2enmod proxy_http
 
# Create a virtual host configuration file
VHOST_CONF="/etc/apache2/sites-available/000-default.conf"
cat <<EOF | sudo tee "$VHOST_CONF"> /dev/null
<VirtualHost *:80>

    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html

    ProxyPreserveHost On
    ProxyPass / http://localhost:5000/
    ProxyPassReverse / http://localhost:5000/
 
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
EOF
sudo systemctl reload apache2
 
cd repo/
echo "cd Into app Done!"
cd springapi/
echo "cd into springapi Done!"
# run the application
sudo mvn spring-boot:start
echo "The App is Running!"