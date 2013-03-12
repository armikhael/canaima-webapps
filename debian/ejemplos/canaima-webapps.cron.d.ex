#
# Regular cron jobs for the canaima-webapps package
#
0 4	* * *	root	[ -x /usr/bin/canaima-webapps_maintenance ] && /usr/bin/canaima-webapps_maintenance
