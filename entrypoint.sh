#!/bin/bash
consul agent -server -bootstrap-expect 3 -data-dir /tmp/consul -config-dir /etc/consul.d/ &
mysqld --wsrep-new-cluster
