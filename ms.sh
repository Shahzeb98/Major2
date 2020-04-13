echo "Enter your username (case-sensitive)"
read use
sudo cp /home/$use/Desktop/installl/mapred-site.xml /usr/local/hadoop/etc/hadoop/mapred-site.xml
sudo chmod 777 /usr/local/hadoop/etc/hadoop/mapred-site.xml
echo "One more file to go"
