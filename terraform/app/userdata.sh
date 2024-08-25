#!/bin/bash

yum install ansible -y &>> /opt/userdata.log
ansible-pull -i localhost, -U https://github.com/hemanthtadikonda/my-webpage ansible-playbook.yml &>> /opt/userdata.log