#!/bin/bash

# run script in jenkins slave

cp -r $WORKSPACE/jenkins/server/sl.xuanran001.com/etc/nagios /etc
cp -r $WORKSPACE/jenkins/server/sl.xuanran001.com/usr/lib64/nagios/plugins /usr/lib64/nagios

/bin/systemctl restart nrpe.service
