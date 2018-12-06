# new-vagrant-vm


##Helpful CMDS
concatinate all files
cat $(ls -t) > outputfile



# Setup database
mysql -uroot -ppassword -e "CREATE DATABASE database;"

# Import bootstrap SQL
mysql -uroot -ppassword database < bootstrap.sql
