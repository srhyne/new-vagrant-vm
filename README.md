# new-vagrant-vm


##Helpful CMDS
concatinate all files
cat $(ls -t) > outputfile



# Setup database
mysql -uroot -ppassword -e "CREATE DATABASE database;"

# Import bootstrap SQL
mysql -uroot -ppassword database < bootstrap.sql


Check NGINX
nginx -c /etc/nginx/nginx.conf -t



Might need to switch IP for your network.

Set up domain mapping

in your local sudo nano /etc/hosts.
192.168.88.33 conveyour.dev
192.168.88.33 conveyour.test
192.168.88.33 conveyour.site
