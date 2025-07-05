# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.1.0] - 2020-02-23

### Added
- osquery_backup option (default false) for ansible module copy/template

### Changed
- RHEL/Centos8 support
- ansible syntax update
- tests coverage
- logrotate: align settings/options with juju4.syslogclient
- fs.inotify.max_user_instances: align with juju4.lxd
- Debian/Ubuntu: don't install debug packages by default (missing in latest osquery release)

## [1.0.0] - 2019-07-20

- fix ansible syntax, mostly CONDITIONAL_BARE_VARS
- travis: switch to kitchen-docker following issue with kitchen-lxd_cli
- travis: multiple minor changes, toolset update
- systemd: hardening settings, mostly seccomp SystemCallFilter

## [0.9.0] - 2019-02-17

### Added
- review options based on auditd - testing limited inside containers/travis
- testing: add multiple patterns for excluded_path
- cgroups restriction
- custom variable for keyserver (PR#8)
- Jenkinsfile
- test/default-fleetmanager: test options with kolide fleet
- Centos/RHEL7 selinux: experimental support [TODO]
- Ubuntu apparmor: initial policy
- Gitignore
- include simple travis, kitchen and vagrant tests
- logrotate for snapshots log file
- option to remove symlink loop file as can creates many warnings at osquery start

### Changed
- Heavy lint following galaxy new rules following adoption of ansible-lint
https://groups.google.com/forum/#!topic/ansible-project/ehrb6AEptzA
https://docs.ansible.com/ansible-lint/rules/default_rules.html
https://github.com/ansible/ansible-lint
- Galaxy dependency naming evolution (juju4.redhat_epel...)

### Removed
- kbrebanov.osquery unmaintained/archived since Sep 2018

## [v0.8] - 2018-06-24 (juju4.osquery)

### Added
- Support expressing an OSQuery secret (PR#5)
- Allow multiline ansible_managed (PR#4)
- testing: load tests (fallocate, split)
- process and sockets auditing
- exclude_paths support
- testing per logger_plugin: filesystem, syslog, filesystem+syslog
- update of osquery apt repository - support trusty, xenial
- Initial fork on Github

### Changed

## [v1.0.0] - 2016-02-18 (kbrebanov.osquery)
