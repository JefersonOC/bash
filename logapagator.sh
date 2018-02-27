#!/bin/bash
LOG_HOME="/opt/jetty/logs"
ZIP_HOME="/home/ec2-user/jetty_logs"

if [ ! -d $ZIP_HOME ]; then
	echo "Creating directory $ZIP_HOME"
	mkdir -p $ZIP_HOME
fi

oldfiles(){
	find $LOG_HOME/*.log* -mtime +10
}

compress(){
	xargs tar -czvPf  $ZIP_HOME/$(date +%Y%m%d%H%M%S).tar.gz
}

remove(){
	xargs -n1 rm
}

oldfiles | compress

if [ $? -ne 0 ]; then
	echo "Failed to compress, exiting"
	exit 1
fi

oldfiles | remove

exit 0

