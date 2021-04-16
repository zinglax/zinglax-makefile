#!/bin/bash
# Creates an initial key and config file.

SSH_KEY="$(hostname)_initial"
ssh-keygen -q -t rsa -N '' -f ${HOME}/.ssh/${SSH_KEY} <<<y 2>&1 >/dev/null
touch ${HOME}/.ssh/config
echo "IdentityFile ${HOME}/.ssh/${SSH_KEY}" >> ${HOME}/.ssh/config
echo "" >> ${HOME}/.ssh/config
echo "Host gitlab.billzingler.com" >> ${HOME}/.ssh/config
echo "User gitlab" >> ${HOME}/.ssh/config
echo "Port 2022" >> ${HOME}/.ssh/config
echo "IdentityFile ${HOME}/.ssh/${SSH_KEY}" >> ${HOME}/.ssh/config
