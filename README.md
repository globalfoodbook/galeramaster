# galeramaster

Docker container that uses MariaDB Galera along with the following ENVs:

ENV MARIADB_USER wordpressmu
ENV MARIADB_PASSWORD password
ENV MARIADB_DATABASE wordpressmu

Galeranode (scottpgallagher/galeranode) attachs to this master in a 3 node cluster.
