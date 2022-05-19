# I made this script to install ten programs that can be used on new Manjaro, Ubuntu, and CentOS installations.
# This script automates the installations and allows me to use it across all three Linux distributions.
# The ten programs that will be installed are listed here:
# Programs to Install:
#*****************************************************************************************************************
#* Manjaro - XFCE 21.2.6                                | Ubuntu - 22.04 LTS          | CentOS - Stream 9 Latest *
#*****************************************************************************************************************
# 01. remmina - rdp client                              | slack                       | htop - detailed system resources monitor
# 02. flameshot - screenshot tool                       | flameshot                   | ksnip - screenshot tool
# 03. spotify - music streaming service                 | spotify                     | thunderbird - mail client
# 04. librewolf - firefox alternative browser           | gimp - photo editing tool   | gimp
# 05. virt-manager - virtual machine manager            | virt-manager                | virt-manager
# 06. apache - http web server                          | apache2 - same as apache    | httpd - same as apache
# 07. slack - team communication tool                   | git - github tool           | git
# 08. libreoffice - Microsoft office alternative suite  | vim - cli text editor       | libreoffice-writer - libreoffice alternative to MS Word
# 09. xournalpp - notepad annotation tool               | xournalpp                   | libreoffice-calc - libreoffice alternative to MS Excel
# 10. notepadqq - text editor                           | notepadqq                   | gvim - same as vim but with a gui

#!/bin/bash/

echo -e "Program Installation Script:\nThis script will install some programs for 3 main Linux distributions\nManjaro | Ubuntu | CentOS\n\"m\"       \"u\"      \"c\"\n\nNOTICE - Your password will be needed atleast once for sudo privileges"

continue=true
while [ $continue = true ]
do
	read -p "Select a distribution [m|u|c]: " userchoice

	if [ $userchoice == "m" ]; # if user chooses Manjaro
	then
		echo -e "\nDistribution is Manjaro:\npacman and pamac commands will be used\n" # pacman is the default app manager for Arch distros
		
		echo -e "-----Enabling AUR Support-----"
		sleep 1
		sudo sed -Ei '/EnableAUR/s/^#//' /etc/pamac.conf # This command enables AUR support through the terminal by uncommenting #EnableAUR in /etc/pamac.conf
		
		updatetrue=true
		while [ $updatetrue = true ]
		do
			read -p "Would you like to update/upgrade your system first? [y|n]: " update
			
			if [ $update == "y" ];
			then
				echo "-----Updating Manjaro-----"
				sleep 1 # pause placeholder for easier following of output commands in a terminal
				sudo pacman -Syyu # force updating all repos and upgrading apps
				updatetrue=false
				
			elif [ $update == "n" ]
			then
				echo "-----Skipping update-----"
				sleep 1
				updatetrue=false
				
			else
				echo -e "Wrong Selection\nTry Again"
				updatetrue=true
			fi
		done
		
		echo -e "\n-----Installing programs-----"
		sleep 1
		sudo pacman -Sy remmina flameshot virt-manager apache libreoffice-fresh xournalpp notepadqq
		sudo pamac install librewolf slack spotify
		echo -e "\n-----Programs Installed-----\n"
		continue=false
		
	elif [ $userchoice == "u" ] # if user chooses Ubuntu
	then
		echo -e "\nDistribution is Ubuntu:\napt and snap commands will be used\n" # dpkg is the default app manager for Debian distros
		
		updatetrue=true
		while [ $updatetrue = true ]
		do
			read -p "Would you like to update/upgrade your system first? [y|n]: " update
			
			if [ $update == "y" ];
			then
				echo "-----Updating Ubuntu-----"
				sleep 1 # pause placeholder for easier following of output commands in a terminal
				sudo apt-get -y update && sudo apt-get -y upgrade # force update all repos and upgrade all programs with auto yes for prompts
				updatetrue=false
				
			elif [ $update == "n" ]	
			then
				echo "-----Skipping update-----"
				sleep 1
				updatetrue=false
				
			else
				echo -e "Wrong Selection\nTry Again"
				updatetrue=true
			fi
		done
		
		echo -e "\n-----Installing programs-----"
		sleep 1
		sudo apt-get -y install flameshot gimp virt-manager apache2 git vim xournalpp notepadqq
		sudo snap -y install slack spotify
		echo -e "\n-----Programs Installed-----\n"
		continue=false
		
	elif [ $userchoice == "c" ] # if user chooses CentOS
	then
		echo -e "\nDistribution is CentOS:\nyum command will be used\n" # rpm is the default app manager for RedHat distros
		
		echo "-----Adding Extra Repositories-----"
		sudo yum -y install epel-release https://rpms.remirepo.net/enterprise/remi-release-9.rpm
		sudo yum repolist
		sleep 1
		
		updatetrue=true
		while [ $updatetrue = true ]
		do
			echo -e ""
			read -p "Would you like to update/upgrade your system first? [y|n]: " update
			
			if [ $update == "y" ];
			then
				echo -e "-----Updating CentOS-----"
				sleep 1 # pause placeholder for easier following of output commands in a terminal
				sudo yum -y check-update && sudo yum update && sudo yum upgrade
				updatetrue=false
				
			elif [ $update == "n" ]	
			then
				echo "-----Skipping update-----"
				sleep 1
				updatetrue=false
				
			else
				echo -e "Wrong Selection\nTry Again"
				updatetrue=true
			fi
		done
		
		echo -e "\n-----Installing programs-----"
		sleep 1
		sudo yum -y install htop ksnip thunderbird gimp virt-manager httpd git libreoffice-writer libreoffice-calc gvim
		echo -e "\n-----Programs Installed-----\n"
		continue=false
		
	else
		echo -e "\nWrong selection.\nPlease try again\n"
		continue=true
	fi
done

echo "-----Script Done-----"