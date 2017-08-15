#!/bin/bash
rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum -y install git


# Redhat thing
chmod +r -R /etc/pki/rhui
yum-config-manager --enable rhui-REGION-rhel-server-optional
