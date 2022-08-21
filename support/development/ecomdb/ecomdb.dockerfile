FROM htsignbasedb

COPY ecomdb-initdb.sh /docker-entrypoint-initdb.d/ecomdb-initdb.sh

RUN mkdir -p /opt/scripts
RUN dos2unix /docker-entrypoint-initdb.d/ecomdb-initdb.sh

