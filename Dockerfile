FROM openjdk:11-jre-slim-buster

ENV OPSGENIE_DOWNLOAD https://s3-us-west-2.amazonaws.com/opsgeniedownloads/repo/opsgenie-zabbix_2.22.0_all.deb

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget && \
    wget ${OPSGENIE_DOWNLOAD} -O opsgenie.deb --no-check-certificate && \
    dpkg -i opsgenie.deb

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh && \
    ln -s /usr/local/bin/docker-entrypoint.sh /

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["zabbix2opsgenie"]