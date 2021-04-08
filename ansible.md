---
layout: page
title: ansible
---

## Installation

```
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```

## Setup

```
/etc/ansible/hosts
```

hosts range:

```
10.3.14.[237:241]
```

## Run ping command

special the login username as root.

```
ansible all -m ping -u root
```

## Run yaml file (playbook)

```
ansible-playbook .playbook/gen_config.yaml
```