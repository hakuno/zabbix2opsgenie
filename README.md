# zabbix2opsgenie
Solução de container como aplicação para rodar isoladamente o script de integração entre Zabbix e OpsGenie.

> Opsgenie Zabbix integration plugin utilizes full capabilities of Opsgenie and provides bi-directional integration with Zabbix.

Esse container foi desenvolvido usando soluções já existentes:
* OpenJDK
* Zabbix plugin

Execução de teste
```
docker run -v ~/opsgenie.conf:/etc/opsgenie/conf/opsgenie-integration.conf hakuno/zabbix2opsgenie:latest -triggerName='zabbix test alert' -triggerStatus='PROBLEM'
```

Mantendo logs
```
docker run --rm -v ~/opsgenie.conf:/etc/opsgenie/conf/opsgenie-integration.conf -v opslogs:/var/log/opsgenie hakuno/zabbix2opsgenie:latest logs
```

Helpers
* actions
* logs
* console


Documentação oficial
https://docs.opsgenie.com/docs/zabbix-plugin
