---
layout: post
title: A container running ECLIPSE CHE named "che-server" already exists
---

## Reproduce

1. Install Docker and Eclipse Che
2. Restart Ubuntu
3. Start Eclipse Che with `sudo che start`, and see the error:

```
WARNING: No swap limit support
---------------------------------------
ERROR: !!!
ERROR:      A container running ECLIPSE CHE named "che-server" already exists.
             1. Use "info" to find it's URL.
             2. Use "restart" to stop it and start anew.
             3. Stop it with "stop".
             4. Remove it manually (docker rm -f che-server) and try again. Or:
             5. Set CHE_SERVER_CONTAINER_NAME to a different value and try again.
ERROR: !!!
---------------------------------------
```

## How to resolve

List all Docker containers.

```
$ sudo docker ps -a
CONTAINER ID        IMAGE                                                                           COMMAND                  CREATED             STATUS                      PORTS                                                                                                                                                                         NAMES
c3548554e674        eclipse-che/workspacedbl9v0m0k1swrkbo_machine89o1ypxdqa1iwq80_che_dev-machine   "/bin/sh -c 'tail -f "   19 hours ago        Exited (1) 33 minutes ago   0.0.0.0:32774->22/tcp, 0.0.0.0:32773->3000/tcp, 0.0.0.0:32772->4401/tcp, 0.0.0.0:32771->4403/tcp, 0.0.0.0:32770->4411/tcp, 0.0.0.0:32769->5000/tcp, 0.0.0.0:32768->9000/tcp   workspacedbl9v0m0k1swrkbo_machine89o1ypxdqa1iwq80_che_dev-machine
d8c388754834        eclipse/che-server:5.0.0-latest                                                 "/home/user/che/bin/d"   21 hours ago        Exited (1) 33 minutes ago   8000/tcp, 0.0.0.0:8080->8080/tcp                                                                                                                                              che-server
17ce642ba978        ubuntu                                                                          "bash"                   21 hours ago        Exited (0) 21 hours ago                                                                                                                                                                                   zen_brown
41a40585b9fc        ubuntu                                                                          "bash"                   21 hours ago        Exited (0) 21 hours ago                                                                                                                                                                                   nostalgic_lamarr
7d3885cb1e31        hello-world                                                                     "/hello"                 21 hours ago        Exited (0) 21 hours ago                                                                                                                                                                                   thirsty_heisenberg
```

Find the image name `eclipse/che-server:5.0.0-latest`

Start with docker CLI

```
sudo docker run --rm -t -v /var/run/docker.sock:/var/run/docker.sock eclipse/che-server:5.0.0-latest start
```