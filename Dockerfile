FROM ubuntu:latest
MAINTAINER Scott P. Gallagher <sgallag@gmail.com>
ENV MARIADB_USER wordpressmu
ENV MARIADB_PASSWORD password
ENV MARIADB_DATABASE wordpressmu
RUN apt-get update && apt-get install -y wget unzip python-software-properties software-properties-common
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
RUN add-apt-repository 'deb http://mirror3.layerjet.com/mariadb/repo/5.5/debian wheezy main'
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y rsync mariadb-galera-server
ADD galera.cnf /etc/mysql/conf.d/galera.cnf
RUN wget https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip
RUN unzip 0.5.2_linux_amd64.zip
RUN mv consul /usr/local/sbin/
RUN chmod +x /usr/local/sbin/consul
RUN mkdir /etc/consul.d
RUN echo '{"service": {"name": "mysql", "tags": ["mysql"], "port": 3306}}' > /etc/consul.d/mysql.json
EXPOSE 3306 4444 4567 4568 8300 8301 8301/udp 8302 8302/udp 8400 8500 53 53/udp
ADD mysql.sh /mysql.sh
RUN chmod +x /mysql.sh
RUN "./mysql.sh"
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
