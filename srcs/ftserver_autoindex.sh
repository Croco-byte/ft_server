# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ftserver_autoindex.sh                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/15 16:51:44 by user42            #+#    #+#              #
#    Updated: 2020/12/15 16:51:45 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
set -e

if [ $# = 1 ]; then
	if [ $1 = "off" ]; then
		sed -i 's/autoindex on;/autoindex off;/g' /etc/nginx/sites-available/ftserver
	elif [ $1 = "on" ]; then
		sed -i 's/autoindex off;/autoindex on;/g' /etc/nginx/sites-available/ftserver
	else
		echo "Please enter on/off to use this"
	fi
else
	echo "Usage : ./ftserver_autoindex.sh on/off"
fi

nginx -s reload
