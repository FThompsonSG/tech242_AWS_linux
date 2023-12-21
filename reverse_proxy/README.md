# Apache Reverse Proxy

## A reverse proxy acts as an intermediary server between client devices (e.g., web browsers) and backend servers (e.g., web application servers). Its primary purpose is to forward client requests to the appropriate backend server and then relay the server's response back to the client.

1. Install Apache, start and enable to ensure it runs at boot
```
# Install Apache
echo "Installing Apache..."
echo ""
sudo DEBIAN_FRONTEND=noninteractive apt install apache2 -y
echo ""
sudo systemctl start apache2
sudo systemctl enable apache2
echo ""
```

2. Enable necessary modules and reload to apply changes
```
# Enable necessary Apache modules
echo "Enabling Apache modules..."
sudo a2enmod proxy
sudo a2enmod proxy_http
echo ""
echo "Apache modules enabled"
echo ""
sudo systemctl reload apache2
```

3. Create a virtual host configuration file by sed command
```
# Create a virtual host configuration file by sed
if grep -q 'ProxyPass / http://localhost:5000/' /etc/apache2/sites-available/000-default.conf; then
    # The string exists, so nothing to do
    echo "Reverse proxy already configured."
else
    # reverse proxy not configured yet
    echo "Configuring reverse proxy..."
    sudo sed -i '/DocumentRoot \/var\/www\/html/ a\ProxyPreserveHost On\nProxyPass \/ http:\/\/localhost:5000\/\nProxyPassReverse \/ http:\/\/localhost:5000\/\n' /etc/apache2/sites-available/000-default.conf
fi
sudo systemctl reload apache2
```

4. OR Create a virtual host configuration file by re-write
```
# Create a virtual host configuration file by re-write
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
```