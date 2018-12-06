apt-get update -y
apt-get install -y nginx



sudo apt-get install php5 -y
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password password'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password password'
sudo apt-get -y install mysql-server-5.5
sudo apt-get install mysql-server-5.5 php5-mysql -y

# Install Packages
sudo apt-get install zip unzip -y
sudo apt-get install php5-fpm php5-common php5-curl php5-mcrypt -y
#php5-xml, php5-mbstring

# Set up mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install mongodb-org --force-yes -y

#Install Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

sudo mv composer.phar /usr/local/bin/composer
#run Composer
export COMPOSER_ALLOW_SUPERUSER=1
cd /var/sites/conveyour.dev
composer install
cd /var/sites/conveyour.dev/public/min
composer install

#install .env
cd /var/sites/conveyour.dev
wget https://raw.githubusercontent.com/laravel/laravel/master/.env.example
cp .env.example .env
php artisan key:generate
rm .env.example

# Setup Database
mysql -uroot -ppassword -e "CREATE DATABASE homestead;"
# Rewrite .env
sed -i 's/DB_USERNAME=homestead/DB_USERNAME=root/g' .env
sed -i 's/DB_PASSWORD=secret/DB_PASSWORD=password/g' .env




echo -e "\nYour machine has been provisioned"
echo "--------------------------------"
echo "MySQL is available with username 'root' and password 'password' (you have to use 127.0.0.1 as opposed to 'localhost')"
