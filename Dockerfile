# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/13 13:39:48 by user42            #+#    #+#              #
#    Updated: 2020/12/13 14:37:23 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Basing custom image on Debian Buster image
FROM debian:buster

# Moving all source files to docker container so we can interact with them when building the image
# This includes setup scripts, and configuration files
COPY srcs/install_packages.sh 	/tmp/
COPY srcs/server_setup.sh	/tmp/
COPY srcs/phpmyadmin_setup.sh	/tmp/
COPY srcs/wordpress_setup.sh	/tmp/

COPY srcs/config.inc.php	/tmp/
COPY srcs/server.conf		/tmp/
COPY srcs/wordpress-5.6.tar.gz	/tmp/
COPY srcs/wp-config.php		/tmp/

# Installing all required packages, including SQL database (MariaDB)
RUN /tmp/install_packages.sh

# Setting up server and copying autoindex script
RUN /tmp/server_setup.sh
COPY srcs/ftserver_autoindex.sh	/etc/nginx

# Setting up phpmyadmin
RUN /tmp/phpmyadmin_setup.sh

# Setting up Wordpress
RUN /tmp/wordpress_setup.sh

# Start services
CMD 	service nginx start; \
	service mysql start; \
	service php7.3-fpm start; \
	bash
