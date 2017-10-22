#!/bin/bash

# Fetch the variables
. parm.txt

# function to get the current time formatted
currentTime()
{
  date +"%Y-%m-%d %H:%M:%S";
}



echo ---$(currentTime)---populate the volumes---
#to zip, use: 	sudo tar zcvf devops_maven_volume.tar.gz /var/nfs/volumes/devops_maven*
sudo tar zxvf devops_maven_volume.tar.gz -C /

echo ---$(currentTime)---create maven service---
sudo docker service create -d \
--name devops-maven \
--mount type=volume,source=devops_maven_volume,destination=/root/.m2,\
volume-driver=local-persist,volume-opt=mountpoint=/var/nfs/volumes/devops_maven_volume \
--mount type=volume,source=devops_jenkins_volume,destination=/home,\
volume-driver=local-persist,volume-opt=mountpoint=/var/nfs/volumes/devops_jenkins_volume \
--network $NETWORK_NAME \
--mode global \
--constraint 'node.role == manager' \
$MAVEN_IMAGE