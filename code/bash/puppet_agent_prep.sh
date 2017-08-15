#!/bin/bash
yum -y install puppet-agent
echo "server = $1" >> /etc/puppetlabs/puppet/puppet.conf
service puppet start
