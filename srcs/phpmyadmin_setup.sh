# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    phpmyadmin_setup.sh                                :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/15 13:18:59 by user42            #+#    #+#              #
#    Updated: 2020/12/15 13:19:00 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-english.tar.gz -P /tmp/

tar xvf /tmp/phpMyAdmin-4.9.7-english.tar.gz -C /tmp
mv /tmp/phpMyAdmin-4.9.7-english /var/www/ftserver/phpmyadmin
rm -rf /tmp/phpMyAdmin.tar.gz
mv /tmp/config.inc.php /var/www/ftserver/phpmyadmin

service mysql start
mysql -u root --skip-password -e "CREATE DATABASE wordpress;"
mysql -u root --skip-password -e "CREATE USER 'phpmyadmin'@'localhost' IDENTIFIED BY 'admin'";
mysql -u root --skip-password -e "GRANT ALL PRIVILEGES ON *.* TO 'phpmyadmin'@'localhost' WITH GRANT OPTION;"
mysql -u root --skip-password -e "FLUSH PRIVILEGES;"
