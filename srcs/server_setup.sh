# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    server_setup.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/14 12:32:47 by user42            #+#    #+#              #
#    Updated: 2020/12/14 12:32:49 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

chown -R www-data /var/www/*
chmod -R 755 /var/www/*

mkdir -p /var/www/ftserver

mv /tmp/server.conf /etc/nginx/sites-available/ftserver
ln -s /etc/nginx/sites-available/ftserver /etc/nginx/sites-enabled/ftserver
rm -rf /etc/nginx/sites-enabled/default

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=France/L=Paris/O=42/OU=42Paris/CN=qroland" -keyout /etc/ssl/private/ftserver.key -out /etc/ssl/certs/ftserver.crt
