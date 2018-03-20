Ansible playbook for container ELK and Filebeat
------

An ansible playbook for Log


## Requirement
None

## Roles

#### Docker
This ansible role installs:

* Docker
* Docker-compose

 Refer to [ansible-role-docker](https://github.com/geerlingguy/ansible-role-docker)

#### Filebeat
This ansible role installs filebeat and build the file

 Refer to [ ansible-role-filebeat](https://github.com/geerlingguy/ansible-role-filebeat)

## Playbooks

* `elk-playbook.yml` deploy the container ELK
* `filebeat-playbook.yml` Filebeat and manage its configuration

#### Usage
```
$ ansible-playbook -i hosts the_playbook.yml
 ```
