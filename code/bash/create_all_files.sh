#!/bin/bash

DIRNAME=`dirname $0`
grep ip-.*compute.internal $DIRNAME/../amazon_hosts > $DIRNAME/../hostfile
awk '/ec2-.*.amazonaws.com/{getline; print}' $DIRNAME/../amazon_hosts > $DIRNAME/../public_ips
python $DIRNAME/../python/create_inventory.py > $DIRNAME/../ansible/inventory

