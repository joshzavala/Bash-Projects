# Simple commands to start openssh and output its status to confirm it active.

#!/bin/bash

# starting openssh
sudo systemctl start sshd.service

sleep 1

# status of openssh
sudo systemctl status sshd.service
