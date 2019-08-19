#!/bin/bash
set -e

if [ "$1" = 'actions' ]; then
    cat /etc/opsgenie/actionCommand.txt
    exit 0;
fi

if [ "$1" = 'logs' ]; then
    tail -f /var/log/opsgenie/zabbix2opsgenie.log
    exit 0;
fi

if [ "$1" = 'console' ]; then
    /bin/bash
    exit 0;
fi

exec /etc/opsgenie/zabbix2opsgenie "$@"