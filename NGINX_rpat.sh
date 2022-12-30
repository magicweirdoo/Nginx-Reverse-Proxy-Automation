#!/bin/bash

SitesAvailableLocation="/etc/nginx/sites-available/"		#Location of the "sites-available" directory
SitesEnabledLocation="/etc/nginx/sites-enabled/"		#Location of the "sites-enabled" directory


clear 								#clears the Terminal for clean astetic

echo "Welcome to the Nginx Reverse Proxy Automation tool!"
echo " "
echo "╭━━━╮╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭━━━╮"
echo "┃╭━╮┃╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱┃╭━╮┃"
echo "┃╰━╯┣━━┳╮╭┳━━┳━┳━━┳━━╮┃╰━╯┣━┳━━┳╮╭┳╮╱╭╮"
echo "┃╭╮╭┫┃━┫╰╯┃┃━┫╭┫━━┫┃━┫┃╭━━┫╭┫╭╮┣╋╋┫┃╱┃┃"
echo "┃┃┃╰┫┃━╋╮╭┫┃━┫┃┣━━┃┃━┫┃┃╱╱┃┃┃╰╯┣╋╋┫╰━╯┃"
echo "╰╯╰━┻━━╯╰╯╰━━┻╯╰━━┻━━╯╰╯╱╱╰╯╰━━┻╯╰┻━╮╭╯"			#Animation
echo "╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭━╯┃"
echo "╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╰━━╯"
echo "╭━━━╮╱╱╭╮╱╱╱╱╱╱╱╱╱╭╮╱╱╱╱╱╱╱╱╭━━━━╮╱╱╱╱╭╮"
echo "┃╭━╮┃╱╭╯╰╮╱╱╱╱╱╱╱╭╯╰╮╱╱╱╱╱╱╱┃╭╮╭╮┃╱╱╱╱┃┃"
echo "┃┃╱┃┣╮┣╮╭╋━━┳╮╭┳━┻╮╭╋┳━━┳━╮╱╰╯┃┃┣┻━┳━━┫┃"
echo "┃╰━╯┃┃┃┃┃┃╭╮┃╰╯┃╭╮┃┃┣┫╭╮┃╭╮╮╱╱┃┃┃╭╮┃╭╮┃┃"
echo "┃╭━╮┃╰╯┃╰┫╰╯┃┃┃┃╭╮┃╰┫┃╰╯┃┃┃┃╱╱┃┃┃╰╯┃╰╯┃╰╮"
echo "╰╯╱╰┻━━┻━┻━━┻┻┻┻╯╰┻━┻┻━━┻╯╰╯╱╱╰╯╰━━┻━━┻━╯"
echo " "

echo "Enter your listening port: " 
read listening_port                             #Example: 80
echo " "

echo "Enter the domain (server_name: )"
read server_name                                #Example: sub.domain.com
echo " "

echo "Enter the proxy_pass: "
read proxy_pass                                 #Example: http://localhost:8080
echo " " 


printf "\nserver{\n	listen $listening_port;\n	server_name $server_name;\n\n	location / {\n		proxy_pass $proxy_pass;\n	}\n}" > $SitesAvailableLocation$server_name
#
#The printf statement writes this file(Example file):
#
#server {
#	listen 80;					#In this case the port '80' is the listening port
#	server_name sub.domain.com			#In this case the server name (Domain name) is 'sub.domain.com'
#
#	location / {
#		proxy_pass http://localhost:8080;	#In this case the proxy pass is 'http://localhost:8080'
#	}
#}

sudo ln -s $SitesAvailableLocation$server_name $SitesEnabledLocation 
sudo systemctl restart nginx
sudo nginx -t
