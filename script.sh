#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo touch /var/www/html/index.html
sudo echo "welcome to hello world $(hostname)" > /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl enable httpd