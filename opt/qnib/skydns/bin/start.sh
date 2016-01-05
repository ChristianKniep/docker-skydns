#!/bin/bash

BINARY=/usr/bin/skydns

export ETCD_MACHINES=http://ETCD_HOST:ETCD_PORT

trap stop SIGTERM

function wait_proc {
    if [ $(ps -ef|grep -v grep|grep -c ${BINARY}) -ne 0 ];then
        sleep 1
        wait_proc
    fi
}

/usr/bin/skydns -verbose -addr="0.0.0.0:53" -domain="DOMAIN" -nameservers="213.73.91.35:53" -machines=MACHINES
MYPID=$(ps -ef|grep -v grep |grep ${BINARY}|awk '{print $2}')

function stop () {
  kill -9 ${MYPID}
}

wait_proc
