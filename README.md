# zabbix2opsgenie

![O2B](https://www.o2b.com.br/wp-content/uploads/2018/07/o2b-logo-dark.png)

Unofficial Docker image of OpenJDK under Zabbix Plugin for OpsGenie.

Solução de container como aplicação para rodar isoladamente o script de integração entre Zabbix e OpsGenie.

> Opsgenie Zabbix integration plugin utilizes full capabilities of Opsgenie and provides bi-directional integration with Zabbix.

Esse container foi desenvolvido usando soluções já existentes:
* OpenJDK
* Zabbix plugin

O Zabbix plugin requere SO baseado em RPM ou DEB. Logo, o Debian Slim (10) foi adotado. E, OpenJDK nesse requisito, atende através da versão Buster.

### Execução de teste
```
docker run --rm -v ~/opsgenie.conf:/etc/opsgenie/conf/opsgenie-integration.conf hakuno/zabbix2opsgenie:latest -triggerName='zabbix test alert' -triggerStatus='PROBLEM'
```

### Execução
```
docker run --rm -v ~/opsgenie.conf:/etc/opsgenie/conf/opsgenie-integration.conf -v opslogs:/var/log/opsgenie hakuno/zabbix2opsgenie:latest -triggerName='{TRIGGER.NAME}' -triggerId='{TRIGGER.ID}' -triggerStatus='{TRIGGER.STATUS}' -triggerSeverity='{TRIGGER.SEVERITY}' -triggerDescription='{TRIGGER.DESCRIPTION}' -triggerUrl='{TRIGGER.URL}' -triggerValue='{TRIGGER.VALUE}' -triggerHostGroupName='{TRIGGER.HOSTGROUP.NAME}' -hostName='{HOST.NAME}' -ipAddress='{IPADDRESS}' -eventId='{EVENT.ID}' -date='{DATE}' -time='{TIME}' -itemKey='{ITEM.KEY}' -itemValue='{ITEM.VALUE}' -recoveryEventStatus='{EVENT.RECOVERY.STATUS}'
```

### Exibindo logs
```
docker run --rm -v ~/opsgenie.conf:/etc/opsgenie/conf/opsgenie-integration.conf -v opslogs:/var/log/opsgenie hakuno/zabbix2opsgenie:latest logs
```

Helpers
* actions: mostra actions disponíveis para o trigger;
* logs: mostra logs;
* console: abre /bin/bash;

Documentação oficial
https://docs.opsgenie.com/docs/zabbix-plugin
