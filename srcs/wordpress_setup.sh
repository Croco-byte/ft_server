# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    wordpress_setup.sh                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/14 16:47:18 by user42            #+#    #+#              #
#    Updated: 2020/12/14 16:47:20 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

tar xvf /tmp/wordpress-5.6.tar.gz -C /var/www/ftserver/
rm -rf /tmp/wordpress-5.6.tar.gz
mv /tmp/wp-config.php /var/www/ftserver/wordpress/wp-config.php
