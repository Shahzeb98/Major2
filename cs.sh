echo "Enter your username (case-sensitive)"
read u
sudo cp /home/$u/Desktop/installl/core-site.xml /usr/local/hadoop/etc/hadoop/core-site.xml
sudo chmod 777 /usr/local/hadoop/etc/hadoop/core-site.xml
echo "Three files to go" 
