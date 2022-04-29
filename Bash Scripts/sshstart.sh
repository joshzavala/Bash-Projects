#!/bin/bash

sudo systemctl start sshd.service

sleep 1

sudo systemctl status sshd.service