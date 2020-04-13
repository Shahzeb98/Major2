echo "Enter your username (case-sensitive)"
read us
sudo cp /home/$us/Desktop/installl/hdfs-site.xml /usr/local/hadoop/etc/hadoop/hdfs-site.xml
sudo chmod 777 /usr/local/hadoop/etc/hadoop/hdfs-site.xml
echo "Two files to go" 
