Ansible playbook for ELK and Filebeat
------
## Description

This playbook has multiple roles, it permit:

* Install and run [ELK physicaly](https://www.elastic.co/elk-stack) or  [docker ELK](https://github.com/papebadiane/docker-elkf)
* Install and run Filebeat
* Load kibana's dashboard and visualizations


## Prerequisites:

- Ubuntu xenial
- Redhat/centos

### Install Ansible 2.5.0

> Ubuntu xenial

```
sudo bash
apt update
apt install -y software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt update
apt install -y ansible

```
> Centos

```
sudo yum install -y ansible
```
--------------------------

##  Set up

* You will need to  install the roles dependencies

```
export OPENIO_LOGANALYZER_RELEASE="0.1.5"
mkdir -p ~/openio-loganalyzer && cd ~/openio-loganalyzer
<!-- curl -sL "https://github.com/papebadiane/ansible-playbook-deployment-elkf/$OPENIO_LOGANALYZER_RELEASE.tar.gz" | tar xz --strip-components=1 -->
ansible-galaxy install -r requirements.yml --force

```
* You will need to make a choice about with `ELK mode` that you would install

  - docker : if you want to install docker ELK
  - bar-metal: if you want to install ELK physicaly on the hostvars


* You will need to change your inventory file `inventories/<YOUR_CHOICE>/hosts` according this:

```
[elkservers]
node1 ansible_host=192.168.1.3

[elkservers:vars]
ansible_user=root


[filebeatservers]
node2 ansible_host=192.168.1.3

[filebeatservers:vars]
ansible_user=root

```


* Change the variables in `inventories/<YOUR_CHOICE>/group_vars/elkservers` and `inventories/<YOUR_CHOICE>/group_vars/filebeatservers` in depend on your hosts configuration.

  - DOCKER  
  
          |      Variable name                 |               Description                                    |     Type    |
          |------------------------------------|--------------------------------------------------------------|-------------|
          | elk_cluster_name                   | The name of Elasticsearch cluster                            | String      |
          | **elasticsearch_heap_size**        | The memory of Elasticsearch HEAP SIZE                        | String      |
          | **logstash_heap_size**             | The memory of Logstash HEAP SIZE                             | String      |
          | **install_docker_elk**             | Install container ELK                                        | Boolean     |
          | docker_elk_version                 | Version of container ELK                                     | String      |
          | **docker_repo_path**               | Path of ELK docker-compose                                   | String      |
          | **openio_namespace**               | The OPENIO namespace                                         | String      |
          | filebeat_prospectors               | List of filebeat prospectors                                 | List        |
          | **kibana_server_group**            | name of group of kibana                                      | String      |
          | **kibana_interface**               | input interface of kibana server                             | String      |



  - BAR METAL

          |      Variable name                 |               Description                                    |     Type    |
          |------------------------------------|--------------------------------------------------------------|-------------|
          | elk_cluster_name                   | The name of Elasticsearch cluster                            | String      |
          | **elasticsearch_heap_size**        | The memory of Elasticsearch HEAP SIZE                        | String      |
          | **logstash_heap_size**             | The memory of Logstash HEAP SIZE                             | String      |
          | **docker_repo_path**               | Path of ELK docker-compose                                   | String      |
          | **install_bar_metal_elk**          | Install  ELK physicaly                                       | Boolean     |
          | es_version                         | ELK Version                                                  | String      |
          | **elasticsearch_data_dirs**        | Elasticsearch data repository                                | String      |
          | kibana_config                      | kibana configuration                                         | String      |
          | **openio_namespace**               | The OPENIO namespace                                         | String      |
          | filebeat_prospectors               | List of filebeat prospectors                                 | List        |
          | **kibana_server_group**            | name of group of kibana                                      | String      |
          | **kibana_interface**               | input interface of kibana server                             | String      |

Before running the playbook, make sure that you have checked that all the fields marked in bold are correct.
## Run

```
$ ansible-playbook -i inventories/<YOUR_CHOICE>/hosts main.yml

```

Now you can to head `http://[ADMIN_IP]:5601`
