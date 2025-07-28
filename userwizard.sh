#!/bin/bash
############################
#CREATE USER AND ADD TO GROUP
############################
#author: Adewumi Victor 
#date : 27/07/2025
#version: V3
##########################

set -oe pipefail

read -p "Enter Username: " username # add user name and save 

while true; do #loopback command
	echo "SELECT GROUP OF USER:"
	echo "D. Developer"
	echo "M. Marketing"
	echo "A. Admin "
	echo "Q. exit"
	read -p "Enter Group [D/M/A/Q] :" Group # Select Group 
	Grouplow=$(echo "$Group" | tr '[:upper:]' '[:lower:]') # change the uppercase to lowercase if selected 
	
	case "$Grouplow" in # conditions of Groups 
		d) group="Developer"
			echo "You selected Developer"
			break;;
		m) group="Marketing"
			echo "You Selected Marketing"
			break;;
		a) group="Admin"
			echo "You Selected Admin" 
			break;;
		q) group="Exit"
			echo "Exiting..."	
			exit 0;;
		*) echo "invalid option please select again $Group";;
	esac
done

sudo useradd -m -G  "$group" "$username" #create user and Add to Group

sudo chmod 700 /home/"$username" #set permission for user

password=$(openssl rand -base64 12) # create random 12 password makesure openssl is installed 

echo "$username":"$password" | sudo chpasswd 
sudo chage -d 0 "$username" # force change password on login
logdir=/home/lab/Desktop/logs # location of user log folder change base on preferences 
Userlog="$logdir/${username}_log.txt"
mkdir -p "$logdir" 
touch $Userlog #create file for user details 


#Append all to created file
echo "User '$username' Created and added to '$group'"
echo "USERNAME : '$username' GROUP: '$group'" >> $Userlog
echo "Temporary Password: $password" >> $Userlog
echo "Permission set (chmod 700) set" >> $Userlog
echo "$(date) created" >> "$Userlog"

