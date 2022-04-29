#!/bin/bash

sudo systemctl stop sshd.service

sleep 1

sudo systemctl status sshd.service