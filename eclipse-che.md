---
layout: page
title: eclipse-che
---

[install docker](/docker.html)

### prepare

```
# mkdir /docker-data
# docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v /docker-data:/data -e CHE_HOST=172.20.4.222 eclipse/che start
```

### start che

```
[root@server222 ~]# docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v /docker-data:/data -e CHE_HOST=172.20.4.222 -e CHE_PORT=8081 eclipse/che start
WARN: Bound 'eclipse/che' to 'eclipse/che:5.16.0'
WARNING: bridge-nf-call-iptables is disabled
WARNING: bridge-nf-call-ip6tables is disabled
INFO: (che cli): 5.16.0 - using docker 17.06.0-ce / native
INFO: (che config): Generating che configuration...
INFO: (che config): Customizing docker-compose for running in a container
INFO: (che start): Preflight checks
WARNING: bridge-nf-call-iptables is disabled
WARNING: bridge-nf-call-ip6tables is disabled
         mem (1.5 GiB):           [OK]
         disk (100 MB):           [OK]
         port 8081 (http):        [AVAILABLE]
         conn (browser => ws):    [OK]
         conn (server => ws):     [OK]

INFO: (che start): Starting containers...
INFO: (che start): Services booting...
INFO: (che start): Server logs at "docker logs -f che-8081"
INFO: (che start): Booted and reachable
INFO: (che start): Ver: 5.16.0
INFO: (che start): Use: http://172.20.4.222:8081
INFO: (che start): API: http://172.20.4.222:8081/swagger
```

### stop che

```
[root@server222 ~]# docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v /docker-data:/data -e CHE_HOST=172.20.4.222 -e CHE_PORT=8081 eclipse/che stop
WARN: Bound 'eclipse/che' to 'eclipse/che:5.16.0'
WARNING: bridge-nf-call-iptables is disabled
WARNING: bridge-nf-call-ip6tables is disabled
INFO: (che cli): 5.16.0 - using docker 17.06.0-ce / native
INFO: (che stop): Stopping workspaces...
INFO: (che stop): Stopping containers...
INFO: (che stop): Removing containers...
```

```
[root@server222 ~]# docker ps
CONTAINER ID        IMAGE                       COMMAND             CREATED             STATUS              PORTS                                        NAMES
64aeda8c9a33        eclipse/che-server:5.16.0   "/entrypoint.sh"    6 days ago          Up 6 days           8000/tcp, 8080/tcp, 0.0.0.0:8081->8081/tcp   che-8081
```

## docker info

```
[root@server222 ~]# docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v /docker-data:/data -e CHE_HOST=172.20.4.222 -e CHE_PORT=8081 eclipse/che info
WARN: Bound 'eclipse/che' to 'eclipse/che:5.16.0'
WARNING: bridge-nf-call-iptables is disabled
WARNING: bridge-nf-call-ip6tables is disabled
INFO: (che cli): 5.16.0 - using docker 17.06.0-ce / native

CLI:
 TTY:            true
 Daemon:         /var/run/docker.sock
 Image:          eclipse/che
 Version:        5.16.0
 Command:        info
 Parameters:     info
Mounts:
 /data:          /docker-data
 /data/instance: not set
 /data/backup:   not set
 /repo:          not set
 /assembly:      not set
 /sync:          not set
 /unison:        not set
 /chedir:        not set
System:
 Docker:         native
 Proxy:          not set
Internal:
 CHE_VERSION:    5.16.0
 CHE_HOST:       172.20.4.222
 CHE_INSTANCE:   /docker-data/instance
 CHE_CONFIG:     /docker-data
 CHE_BACKUP:     /docker-data/backup
 CHE_REGISTRY:   /version
 CHE_DEBUG:      false
 IP Detection:   172.20.4.222
 Initialized:    true
Image Registry:
 IMAGE_INIT=eclipse/che-init:5.16.0
 IMAGE_CHE=eclipse/che-server:5.16.0
 IMAGE_COMPOSE=docker/compose:1.8.1
 IMAGE_TRAEFIK=traefik:v1.3.0-rc3
 BOOTSTRAP_IMAGE_ALPINE=alpine:3.4
 BOOTSTRAP_IMAGE_CHEIP=eclipse/che-ip:5.16.0
 UTILITY_IMAGE_CHEACTION=eclipse/che-action:5.16.0
 UTILITY_IMAGE_CHEDIR=eclipse/che-dir:5.16.0
 UTILITY_IMAGE_CHETEST=eclipse/che-test:5.16.0
 UTILITY_IMAGE_CHEMOUNT=eclipse/che-mount:5.16.0
che.env:
 CHE_HOST=172.20.4.222
 CHE_SINGLE_PORT=false
```

## References

- [https://www.eclipse.org/che/docs/setup/getting-started/](https://www.eclipse.org/che/docs/setup/getting-started/)
- [https://github.com/eclipse/che/issues/3955#issuecomment-276646481](https://github.com/eclipse/che/issues/3955#issuecomment-276646481)