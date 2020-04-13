echo "Enter your username (case-sensitive)"
read user
sudo cp /home/$user/Desktop/installl/yarn-site.xml /usr/local/hadoop/etc/hadoop/yarn-site.xml
sudo chmod 777 /usr/local/hadoop/etc/hadoop/yarn-site.xml
echo "This is the last file"
