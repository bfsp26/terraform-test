#!/bin/bash
echo "Script executed with user_data field." > ~/user_data.txt
dnf update -y
dnf install httpd -y
systemctl enable httpd
systemctl start httpd