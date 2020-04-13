clear 

echo "     ██████╗ ███╗   ██╗███████╗     ██████╗██╗     ██╗ ██████╗██╗  ██╗    ██████╗  ██████╗  ██████╗ ███╗   ███╗        ";
echo "    ██╔═══██╗████╗  ██║██╔════╝    ██╔════╝██║     ██║██╔════╝██║ ██╔╝    ██╔══██╗██╔═══██╗██╔═══██╗████╗ ████║        ";
echo "    ██║   ██║██╔██╗ ██║█████╗      ██║     ██║     ██║██║     █████╔╝     ██████╔╝██║   ██║██║   ██║██╔████╔██║        ";
echo "    ██║   ██║██║╚██╗██║██╔══╝      ██║     ██║     ██║██║     ██╔═██╗     ██╔══██╗██║   ██║██║   ██║██║╚██╔╝██║        ";
echo "    ╚██████╔╝██║ ╚████║███████╗    ╚██████╗███████╗██║╚██████╗██║  ██╗    ██████╔╝╚██████╔╝╚██████╔╝██║ ╚═╝ ██║        ";
echo "     ╚═════╝ ╚═╝  ╚═══╝╚══════╝     ╚═════╝╚══════╝╚═╝ ╚═════╝╚═╝  ╚═╝    ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝     ╚═╝        ";
echo "                                                                                                                       ";
echo "██╗  ██╗ █████╗ ██████╗  ██████╗  ██████╗ ██████╗     ███████╗ ██████╗ ██╗     ██╗   ██╗████████╗██╗ ██████╗ ███╗   ██╗";
echo "██║  ██║██╔══██╗██╔══██╗██╔═══██╗██╔═══██╗██╔══██╗    ██╔════╝██╔═══██╗██║     ██║   ██║╚══██╔══╝██║██╔═══██╗████╗  ██║";
echo "███████║███████║██║  ██║██║   ██║██║   ██║██████╔╝    ███████╗██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██╔██╗ ██║";
echo "██╔══██║██╔══██║██║  ██║██║   ██║██║   ██║██╔═══╝     ╚════██║██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██║╚██╗██║";
echo "██║  ██║██║  ██║██████╔╝╚██████╔╝╚██████╔╝██║         ███████║╚██████╔╝███████╗╚██████╔╝   ██║   ██║╚██████╔╝██║ ╚████║";
echo "╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝  ╚═════╝  ╚═════╝ ╚═╝         ╚══════╝ ╚═════╝ ╚══════╝ ╚═════╝    ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝";
echo "                                                                                                                       ";

#sleep 5

echo "Welcome, Get your computer configured for bigdata processing with complete bigdata tools"

#sleep 5

echo "Enter your username"
read unamee
sudo sh -c "echo \"$unamee ALL=(user) NOPASSWD: ALL\" >> /etc/sudoers"

#sleep 5

echo "Getting latest update for you"

sudo apt-get update -y
sudo apt-get upgrade -y

#sleep 5

echo "Downloading wget"
sudo apt-get install wget

echo "Downloading Default JDK version"
sudo apt-get install default-jdk -y

#sleep 5

#echo "Do you want to download screen recorder tool? Reply only in (Y or N)"
#read k
#if [ $k == Y ] || [ $k == y ]
#then
#   sudo apt-get install kazam -y
#else
#   echo "skipping the optional package"
#fi

#clear
#echo "Installing ssh services and setting it up"
#sleep 2
#sudo apt-get install ssh -y#
#
#echo "Press enter, when asked"

#ssh-keygen -t rsa -P '' 

#sleep 2

#echo "copying ssh files"
#cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys

#*************************************************************************************
clear
echo "****************************************************************************************************************************************************"
echo "Downloading Hadoop 2.6 in this system"
wget https://archive.apache.org/dist/hadoop/core/hadoop-2.6.0/hadoop-2.6.0.tar.gz
tar -xvzf hadoop-2.6.0.tar.gz
sudo mv hadoop-2.6.0 /usr/local/hadoop
sudo rm hadoop-2.6.0.tar.gz

#sleep 1
#clear
#sleep 1

#echo "Note the version of java (specially middle digit in version)"
#sleep 5
#java -version

#sleep 5
#echo "Enter the version of java"
#read j 


echo "Making changes in ~/.bashrc file"

echo "#**********Java, Hadoop, Yarn path and Environment setup**********" >> ~/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-$j-openjdk-amd64" >> ~/.bashrc 
echo "export HADOOP_INSTALL=/usr/local/hadoop" >> ~/.bashrc  
echo "export PATH=\$PATH:\$HADOOP_INSTALL/bin" >> ~/.bashrc
echo "export PATH=\$PATH:\$HADOOP_INSTALL/sbin" >> ~/.bashrc
echo "export HADOOP_MAPRED_HOME=\$HADOOP_INSTALL" >> ~/.bashrc
echo "export HADOOP_COMMON_HOME=\$HADOOP_INSTALL" >> ~/.bashrc
echo "export HADOOP_HDFS_HOME=\$HADOOP_INSTALL" >> ~/.bashrc
echo "export YARN_HOME=\$HADOOP_INSTALL" >> ~/.bashrc
echo "#******************************************************************" >> ~/.bashrc

#sleep 2

source ~/.bashrc

echo "Replacing the java path in hadoop-env.sh file"

sed -i 's/export JAVA_HOME=${JAVA_HOME}/export JAVA_HOME=\/usr\/lib\/jvm\/java-8-openjdk-amd64/' /usr/local/hadoop/etc/hadoop/hadoop-env.sh
echo "Done"

echo "****************************************************************************************************************************"
sudo cp /home/$unamee/Desktop/installl/core-site.xml /usr/local/hadoop/etc/hadoop/core-site.xml
sudo chmod 777 /usr/local/hadoop/etc/hadoop/core-site.xml
echo "Three files to go" 
sudo cp /home/$unamee/Desktop/installl/hdfs-site.xml /usr/local/hadoop/etc/hadoop/hdfs-site.xml
sudo chmod 777 /usr/local/hadoop/etc/hadoop/hdfs-site.xml
echo "Two files to go"
sudo cp /home/$unamee/Desktop/installl/mapred-site.xml /usr/local/hadoop/etc/hadoop/mapred-site.xml
sudo chmod 777 /usr/local/hadoop/etc/hadoop/mapred-site.xml
echo "One more file to go"
sudo cp /home/$unamee/Desktop/installl/yarn-site.xml /usr/local/hadoop/etc/hadoop/yarn-site.xml
sudo chmod 777 /usr/local/hadoop/etc/hadoop/yarn-site.xml
echo "This is the last file"

sed -i 's/<value>\/home\/sample1\/tmp<\/value>/<value>\/home\/'$unamee'\/tmp<\/value>/' /usr/local/hadoop/etc/hadoop/core-site.xml
echo "done"
sed -i 's/<value>\/home\/sample1\/tmp\/namenode<\/value>/<value>\/home\/'$unamee'\/tmp\/namenode<\/value>/' /usr/local/hadoop/etc/hadoop/hdfs-site.xml
sed -i 's/<value>\/home\/sample2\/tmp\/datanode<\/value>/<value>\/home\/'$unamee'\/tmp\/datanode<\/value>/' /usr/local/hadoop/etc/hadoop/hdfs-site.xml
