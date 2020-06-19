# osquery

Installs and configure osquery
* file integrity monitoring
* packs

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 2.2
 * 2.3
 * 2.5

### Operating systems


## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - devoinc.osquery
```

Run
```
$ ansible-playbook -i inventory site.yml
```

## Variables

Sample. See defaults/main.yml for full scope

```
osquery_service_enable: true
osquery_debug_packages_install: true
## define this if don't want to use upstream ones
#osquery_repository: ''
#osquery_repositorykey: ''

osquery_template: 'osquery.conf.j2'
#osquery_upload_packs: []
osquery_upload_packs:
  - osquery-snapshots-pack
  - osquery-monitoring2-pack
osquery_packs:
  - "osquery-monitoring"
  - "incident-response"
  - "it-compliance"
  - "ossec-rootkit"
  - "vuln-management"
  - "hardware-monitoring"
  - "osquery-snapshots-pack"
  - osquery-monitoring2-pack
osquery_config_plugin: 'filesystem'
osquery_logger_plugin: 'filesystem'
#osquery_logger_plugin: 'syslog'
#osquery_logger_plugin: 'filesystem,syslog'
osquery_flags: []

osquery_fim: true
osquery_fim_interval: 300
```

## FAQ

TBD

## Troubleshooting & Known issues

TBD

## License

BSD 2-clause

## References

* Original role made by Kevin Brebanov.
