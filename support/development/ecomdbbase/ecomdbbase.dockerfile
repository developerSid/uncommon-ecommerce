ARG postgresVer=14.3
FROM docker.io/postgres:${postgresVer}-alpine

ARG pgpartmanVer=4.6.2
ARG pgcronVer=1.4.1

RUN apk add --no-cache --virtual .build-deps \
        wget unzip \
        bison \
		  coreutils \
		  dpkg-dev dpkg \
		  flex \
		  gcc \
		  krb5-dev \
		  libc-dev \
		  libedit-dev \
		  libxml2-dev \
		  libxslt-dev \
		  linux-headers \
		  llvm-dev clang g++ \
		  make \
		  openldap-dev \
		  openssl-dev \
		  perl-dev \
		  perl-ipc-run \
		  perl-utils \
		  python3-dev \
		  tcl-dev \
		  util-linux-dev \
		  zlib-dev \
		  icu-dev && \
    wget https://github.com/pgpartman/pg_partman/archive/refs/tags/v${pgpartmanVer}.zip && \
    unzip v${pgpartmanVer}.zip && rm v${pgpartmanVer}.zip && \
    wget https://github.com/citusdata/pg_cron/archive/refs/tags/v${pgcronVer}.zip && \
    unzip v${pgcronVer}.zip && rm v${pgcronVer}.zip && \
    cd /pg_partman-${pgpartmanVer} && make NO_BGW=1 && make install && cd / && rm -r /pg_partman-${pgpartmanVer} && \
    cd /pg_cron-${pgcronVer} && make && make install && cd / && rm -r /pg_cron-${pgcronVer} && \
    apk del --no-network .build-deps

RUN apk add --no-cache pspg dos2unix

COPY pgpass /root/.pgpass
COPY psqlrc /root/.psqlrc
COPY postgresql.conf /usr/local/share/postgresql/postgresql.conf.sample

RUN mkdir -p /opt/scripts

COPY db-ready.sh /opt/scripts/db-ready.sh

RUN chmod 0600 /root/.pgpass && \
    chmod a+x /opt/scripts/db-ready.sh
