FROM openjdk:11-jre-slim-buster

ENV OPSGENIE_DOWNLOAD https://s3-us-west-2.amazonaws.com/opsgeniedownloads/repo/opsgenie-zabbix_2.22.0_all.deb

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget && \
    wget ${OPSGENIE_DOWNLOAD} -O opsgenie.deb --no-check-certificate && \
    dpkg -i opsgenie.deb

VOLUME ["/var/log/opsgenie"]

WORKDIR /etc/opsgenie

ENTRYPOINT ["/etc/opsgenie/zabbix2opsgenie"]