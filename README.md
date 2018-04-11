Ansible playbook for container ELK and Filebeat
------
## Description

This playbook install run docker container ELK from repository [docker_elkf](https://github.com/papebadiane/ansible-docker-elkf.git) on an admin node, install and run Filebeat on other Nodes


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

##  Setup

You will need to  install the roles dependencies

```
export OPENIO_LOGANALYZER_RELEASE="0.1.1"
mkdir -p ~/openio-loganalyzer && cd ~/openio-loganalyzer
curl -sL "https://github.com/papebadiane/ansible-docker-elkf/archive/$OPENIO_LOGANALYZER_RELEASE.tar.gz" | tar xz --strip-components=1
ansible-galaxy install -r requirements.yml --force

```

You will need to **change your inventory file** according this [example](https://github.com/papebadiane/ansible-docker-elkf/blob/master/inventory/testing.ini)


```
$ cp inventory/testing.ini inventory/current.ini

$ vim inventory/current.ini

```


## Configure

Below you will find a description of the variables of the playbook



|      Variable name                 |               Description                                    |     Type    |
|------------------------------------|--------------------------------------------------------------|-------------|
| **openio_namespace**               | The OPENIO namespace                                         | String      |
| **elk_install_path**               | the path of repository where the projet will be stored       | String      |
| filebeat_prospectors               | List of filebeat prospectors                                 | List        |
| **elkf_admin_group**               | name of group for elk cluster                                | String      |
| **elkf_admin_iface**               | input interface of admin's host                              | String      |

Before running the playbook, make sure that you have checked that all the fields marked in bold are correct.

#### JVM tunning

Elasticsearch starts with 1/4 of the total host memory allocated to the JVM Heap Size.

The startup scripts for Elasticsearch can append extra JVM options from the value of an environment variable, allowing the user to adjust the amount of memory that can be used by each component

|      Environment Variable          |               Description                                    |
|------------------------------------|--------------------------------------------------------------|
|   ES_JAVA_OPTS                     | memory allocated to the Heap size of Elasticsearch container |

## Run

```
$ ansible-playbook -i inventory/current.ini main.yml

```

Now you can to head `http://[ADMIN_IP]:5601`
