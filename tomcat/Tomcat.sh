/sbin/init
systemctl daemon-reload
systemctl mask getty@tty1.service
systemctl start tomcat
#/bin/bash