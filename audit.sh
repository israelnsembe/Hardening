#!/bin/bash

#Description: Audit a centos Server
#Author: Izzy1.0
#Date: 4/17/2021

echo -e "\n ********************************************* \n" > /var/log/CentosAudit-$(date +%F)
#echo -e "\n ********************************************* \n" >> /var/log/CentosAudit-$(date +%F)
echo -e "\n ************* CentOS 7 Audit **************** \n" >> /var/log/CentosAudit-$(date +%F)
echo -e "\n ********************************************* \n" >> /var/log/CentosAudit-$(date +%F)



echo -e "\n ********************************************* \n" 
echo -e "\n ************* CentOS 7 Audit **************** \n"
echo -e "\n ***************Processing******************** \n" 
echo -e "\n ********************************************* \n" 


echo -e "\n This script is generating a file to report the audit of the a centos 7 system sent to >> /var/log/CentosAudit+(date) \n"
sleep 2
echo -e "\n Audit Done! \n"

##
echo -e "\n Checking if the file /etc/hosts exists \n" >> /var/log/CentosAudit-$(date +%F)
if [ -f /etc/hosts ]
then
echo -e "\n the file /etc/hosts exist in the system \n" >> /var/log/CentosAudit-$(date +%F)
else
echo -e "\n the file /etc/hosts does not exist \n" >> /var/log/CentosAudit-$(date +%F)
fi

##
echo -e "\n Checking if the file /etc/sysconfig/network exists \n" >> /var/log/CentosAudit-$(date +%F)
if [ -f /etc/sysconfig/network ]
then
echo -e "\n the file /etc/sysconfig/network exist in the system \n" >> /var/log/CentosAudit-$(date +%F)
else
echo -e "\n the file /etc/sysconfig/network does not exist \n" >> /var/log/CentosAudit-$(date +%F)
fi

##
echo -e "\n Checking what the selinux is set to " >> /var/log/CentosAudit-$(date +%F)
echo -e $(cat /etc/selinux/config | grep ^SELINUX=) >> /var/log/CentosAudit-$(date +%F) 

##
echo -e "\n Checking the uid of the user nobody \n" >> /var/log/CentosAudit-$(date +%F) 
echo -e $(id nobody | awk  '{print$1}') >> /var/log/CentosAudit-$(date +%F)

##
echo -e "\n Checking if samba package is installed \n" >> /var/log/CentosAudit-$(date +%F)
rpm -q samba
if [ $? -eq 0 ]
then
echo -e "\n The samba package is installed \n" >> /var/log/CentosAudit-$(date +%F)
else
echo -e "\n The samba package is not installed \n" >> /var/log/CentosAudit-$(date +%F)
fi 

##
echo -e "\n Checking if curl is installed \n" >> /var/log/CentosAudit-$(date +%F)
rpm -q curl
if [ $? -eq 0 ]
then
echo -e "\n curl command is installed \n" >> /var/log/CentosAudit-$(date +%F)
else
echo -e "\n curl command is not installed \n" >> /var/log/CentosAudit-$(date +%F)
fi 

##
echo -e "\n Checking if docker is installed \n" >> /var/log/CentosAudit-$(date +%F)
rpm -q docker
if [ $? -eq 0 ]
then
echo -e "\n docker is installed \n" >> /var/log/CentosAudit-$(date +%F)
else
echo -e "\n docker is not installed \n" >> /var/log/CentosAudit-$(date +%F)
fi 

##
echo -e "\n Checkng if the daemon auditd is running and enable \n" >> /var/log/CentosAudit-$(date +%F)
echo -e "\n The daemon auditd is `systemctl is-active auditd` and `systemctl is-enabled auditd` \n" >> /var/log/CentosAudit-$(date +%F)

##
echo -e "\n Checking the hostname running the system \n" >> /var/log/CentosAudit-$(date +%F)
echo -e "\n The hostname running the system is `hostname` \n" >> /var/log/CentosAudit-$(date +%F)

##
echo -e "\n Checking the total memory of the system in mgbytes \n" >> /var/log/CentosAudit-$(date +%F)
echo -e "\n The totel memory of the system is `free -m | awk 'NR== 2 {print $2}'` mgb \n" >> /var/log/CentosAudit-$(date +%F)

##
echo -e "\n Checking if the system is 32 or 64 bits \n" >> /var/log/CentosAudit-$(date +%F)
echo -e "\n The system running is $(getconf LONG_BIT) bit \n" >> /var/log/CentosAudit-$(date +%F)

##
echo -e "\n Checking if there is a logfile configured on the sudo tool \n" >> /var/log/CentosAudit-$(date +%F)
grep logfile /etc/sudoers
if [ $? -eq 0 ] 
then 
echo -e "\n The logfile is configured on this system \n" >> /var/log/CentosAudit-$(date +%F)
else 
echo -e "\n The logfile is not configured on this system \n" >> /var/log/CentosAudit-$(date +%F)
fi





