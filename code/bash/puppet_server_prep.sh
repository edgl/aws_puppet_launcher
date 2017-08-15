#!/bin/bash

yum -y install puppetserver

cd /opt
mkdir disk1 disk2
cd disk1
git clone https://github.com/jjonez/puppet-hdpdeploy.git
cd puppet-hdpdeploy
git checkout deved

cd /opt/disk2
scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i /root/.ssh/hwx_hdp_demo.pem -pr ec2-user@172.31.35.95:/home/ec2-user/mycd/* .
# create the softlink
ln -s /opt/disk1/puppet-hdpdeploy/puppet-ambari /etc/puppetlabs/code/environments/production/modules/ambari
ln -s /opt/disk1/puppet-hdpdeploy/puppet-bdpenv /etc/puppetlabs/code/environments/production/modules/bdpenv

# install the modules
/opt/disk1/puppet-hdpdeploy/scripts/install_puppetlabs_modules.sh /opt/disk1/puppet-hdpdeploy/scripts/install.conf

# Sign
echo 'autosign = true' >> /etc/puppetlabs/puppet/puppet.conf

# start puppetserver
service puppetserver start
