---
layout: page
title: Git Proxy
---

## Summary

Proxy can be shadowsocks:

- 127.0.0.1:1080 - Socks5 proxy
- 127.0.0.1:8080 - HTTP proxy

## OS: macOS

### Clone with SSH

#### Method 1

Modify `~/.ssh/config`

```
Host github.com
   HostName github.com
   User git
   # HTTP proxy
   # ProxyCommand socat - PROXY:127.0.0.1:%h:%p,proxyport=8080
   # Socks5 proxy
   # ProxyCommand nc -v -x 127.0.0.1:1080 %h %p
```

#### Method 2

Modify `~/.gitconfig`

```
[http]
  proxy = socks5://127.0.0.1:1080
[https]
  proxy = socks5://127.0.0.1:1080
```

## OS: Ubuntu

### Clone with SSH

`~/.ssh/config`

```
sudo apt install socat
```

```
Host=github.com
#ProxyCommand=socat - PROXY:127.0.0.1:%h:%p,proxyport=8080,proxyauth=user:pwd
ProxyCommand=socat - PROXY:127.0.0.1:%h:%p,proxyport=8080
```

test

```
ssh git@github.com -vvv
```

clone or pull

```
git clone git@github.com:octocat/Hello-World.git
git pull
```

### Clone with HTTPS

`~/.gitconfig`

````
# git proxy for ss
# https://gist.github.com/laispace/666dd7b27e9116faece6
# ```sh
# git config --global http.proxy 'socks5://127.0.0.1:1080'
# git config --global https.proxy 'socks5://127.0.0.1:1080'
# ```

# Note: no effect on ssh git clone
[http]
  #proxy = socks5://127.0.0.1:1080
	proxy = http://127.0.0.1:8080
[https]
  #proxy = socks5://127.0.0.1:1080
	proxy = https://127.0.0.1:8080
````

## References

- [https://gist.github.com/sit/49288](https://gist.github.com/sit/49288)
- [https://gist.github.com/laispace/666dd7b27e9116faece6](https://gist.github.com/laispace/666dd7b27e9116faece6)
- [macOS 给 Git(Github) 设置代理（HTTP/SSH）](https://gist.github.com/chuyik/02d0d37a49edc162546441092efae6a1)
