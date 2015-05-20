#!/bin/bash
consul agent -server -bootstrap-expect 3 -data-dir /tmp/consul -config-dir /etc/consul.d/ -ui-dir /0.5.2_web_ui&
mysqld --wsrep-new-cluster
