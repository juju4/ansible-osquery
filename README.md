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

Tested on Ubuntu 14.04, 16.04, 18.04, Centos 7. Kitchen test vagrant or lxd, Travis.

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - juju4.osquery
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

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).
Default kitchen config (.kitchen.yml) is lxd-based, while (.kitchen.vagrant.yml) is vagrant/virtualbox based.

Once you ensured all necessary roles are present, You can test with:
```
$ gem install kitchen-ansible kitchen-lxd_cli kitchen-sync kitchen-vagrant
$ cd /path/to/roles/juju4.osquery
$ kitchen verify
$ kitchen login
$ KITCHEN_YAML=".kitchen.vagrant.yml" kitchen verify
```
or
```
$ cd /path/to/roles/juju4.osquery/test/vagrant
$ vagrant up
$ vagrant ssh
```

## FAQ

* how to review quickly log locally?
use jq. for example
```
jq '.name' /var/log/osquery/osqueryd.results.log | sort | uniq -c | sort -nr
jq 'select(.name == "fim") | .columns.target_path + " " + .columns.action' /var/log/osquery/osqueryd.results.log | sort | uniq -c | sort -nr
jq 'select(.name == "pack_incident-response_process_memory") | .columns.path + " " + .columns.permissions' /var/log/osquery/osqueryd.results.log  | sort | uniq -c | sort -nr
jq 'select(.name == "pack_incident-response_listening_ports") | .columns.path + " " + .columns.port + " " +.columns.protocol' /var/log/osquery/osqueryd.results.log
jq 'select(.name == "pack_incident-response_last") | .columns.username + " " + .columns.host + " " + .columns.tty + " " + .columns.type' /var/log/osquery/osqueryd.results.log
```
See also templates/osquery_report.sh.j2

## Troubleshooting & Known issues

TBD

## License

BSD 2-clause

## References

* Original role made by Kevin Brebanov.
