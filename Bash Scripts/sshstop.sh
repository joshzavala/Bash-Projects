# Small commands to stop openssh.
# I use it to auto stop the serive when I log out of my computer.

#!/bin/bash

# stopping openssh
sudo systemctl stop sshd.service

sleep 1

# status of openssh
sudo systemctl status sshd.service
