---
layout: page
title: shadowsocks
---

## Insall shadowsocks on Ubuntu 18.10 (Vultr)

```
root@vultr:~# cat /etc/issue
Ubuntu 18.10 \n \l
```

```
root@vultr:~# sudo apt-get install python-pip -y
root@vultr:~# pip install shadowsocks
```

but see errors "ImportError: No module named setuptools"

```
Collecting shadowsocks
  Downloading https://files.pythonhosted.org/packages/02/1e/e3a5135255d06813aca6631da31768d44f63692480af3a1621818008eb4a/shadowsocks-2.8.2.tar.gz
    Complete output from command python setup.py egg_info:
    Traceback (most recent call last):
      File "<string>", line 1, in <module>
    ImportError: No module named setuptools

    ----------------------------------------
Command "python setup.py egg_info" failed with error code 1 in /tmp/pip-build-U7TGBj/shadowsocks/
```

according to [http://stackoverflow.com/questions/14426491/python-3-importerror-no-module-named-setuptools](http://stackoverflow.com/questions/14426491/python-3-importerror-no-module-named-setuptools)

first check the python version
```
root@vultr:~# python --version
Python 2.7.15+
```

then try to install `python-setuptools`

```
root@vultr:~# sudo apt-get install python-setuptools -y
```

try to install shadowsocks again

```
root@vultr:~# pip install shadowsocks
```

but see errors "Failed building wheel for shadowsocks"

```
Collecting shadowsocks
  Using cached https://files.pythonhosted.org/packages/02/1e/e3a5135255d06813aca6631da31768d44f63692480af3a1621818008eb4a/shadowsocks-2.8.2.tar.gz
Building wheels for collected packages: shadowsocks
  Running setup.py bdist_wheel for shadowsocks ... error
  Complete output from command /usr/bin/python -u -c "import setuptools, tokenize;__file__='/tmp/pip-build-bA5aUo/shadowsocks/setup.py';f=getattr(tokenize, 'open', open)(__file__);code=f.read().replace('\r\n', '\n');f.close();exec(compile(code, __file__, 'exec'))" bdist_wheel -d /tmp/tmpo_acA_pip-wheel- --python-tag cp27:
  usage: -c [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]
     or: -c --help [cmd1 cmd2 ...]
     or: -c --help-commands
     or: -c cmd --help

  error: invalid command 'bdist_wheel'

  ----------------------------------------
  Failed building wheel for shadowsocks
  Running setup.py clean for shadowsocks
Failed to build shadowsocks
Installing collected packages: shadowsocks
  Running setup.py install for shadowsocks ... done
Successfully installed shadowsocks-2.8.2
```

setup config of shadowsocks

```
vim /etc/shadowsocks.json
```

```
{
    "server":"0.0.0.0",
    "server_port":8388,
    "local_port":1080,
    "password": "...",
    "timeout":600,
    "method":"aes-256-cfb"
}
```

```
root@vultr:~# ssserver --version
Shadowsocks 2.8.2
```

try to start

```
root@vultr:~# sudo ssserver -c /etc/shadowsocks.json -d start
```

but see errors:

```
INFO: loading config from /etc/shadowsocks.json
2019-03-03 05:52:50 INFO     loading libcrypto from libcrypto.so.1.1
Traceback (most recent call last):
  File "/usr/local/bin/ssserver", line 11, in <module>
    load_entry_point('shadowsocks==2.8.2', 'console_scripts', 'ssserver')()
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/server.py", line 34, in main
    config = shell.get_config(False)
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/shell.py", line 262, in get_config
    check_config(config, is_local)
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/shell.py", line 124, in check_config
    encrypt.try_cipher(config['password'], config['method'])
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/encrypt.py", line 44, in try_cipher
    Encryptor(key, method)
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/encrypt.py", line 83, in __init__
    random_string(self._method_info[1]))
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/encrypt.py", line 109, in get_cipher
    return m[2](method, key, iv, op)
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/crypto/openssl.py", line 76, in __init__
    load_openssl()
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/crypto/openssl.py", line 52, in load_openssl
    libcrypto.EVP_CIPHER_CTX_cleanup.argtypes = (c_void_p,)
  File "/usr/lib/python2.7/ctypes/__init__.py", line 379, in __getattr__
    func = self.__getitem__(name)
  File "/usr/lib/python2.7/ctypes/__init__.py", line 384, in __getitem__
    func = self._FuncPtr((name_or_ordinal, self))
AttributeError: /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1: undefined symbol: EVP_CIPHER_CTX_cleanup
```

try to install `python-m2crypto` (update later: no need this step)

```
root@vultr:~# sudo apt-get install python-m2crypto
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following additional packages will be installed:
  python-typing
Suggested packages:
  m2crypto-doc
The following NEW packages will be installed:
  python-m2crypto python-typing
0 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
Need to get 191 kB of archives.
After this operation, 1012 kB of additional disk space will be used.
Do you want to continue? [Y/n]
Get:1 http://archive.ubuntu.com/ubuntu cosmic/universe amd64 python-typing all 3.6.4-1 [22.7 kB]
Get:2 http://archive.ubuntu.com/ubuntu cosmic/universe amd64 python-m2crypto amd64 0.27.0-6 [168 kB]
Fetched 191 kB in 2s (117 kB/s)
Selecting previously unselected package python-typing.
(Reading database ... 66690 files and directories currently installed.)
Preparing to unpack .../python-typing_3.6.4-1_all.deb ...
Unpacking python-typing (3.6.4-1) ...
Selecting previously unselected package python-m2crypto.
Preparing to unpack .../python-m2crypto_0.27.0-6_amd64.deb ...
Unpacking python-m2crypto (0.27.0-6) ...
Setting up python-typing (3.6.4-1) ...
Setting up python-m2crypto (0.27.0-6) ...
```

try to start again, but the same error

```
root@vultr:~# sudo ssserver -c /etc/shadowsocks.json -d start # 启动
INFO: loading config from /etc/shadowsocks.json
2019-03-03 05:52:50 INFO     loading libcrypto from libcrypto.so.1.1
Traceback (most recent call last):
  File "/usr/local/bin/ssserver", line 11, in <module>
    load_entry_point('shadowsocks==2.8.2', 'console_scripts', 'ssserver')()
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/server.py", line 34, in main
    config = shell.get_config(False)
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/shell.py", line 262, in get_config
    check_config(config, is_local)
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/shell.py", line 124, in check_config
    encrypt.try_cipher(config['password'], config['method'])
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/encrypt.py", line 44, in try_cipher
    Encryptor(key, method)
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/encrypt.py", line 83, in __init__
    random_string(self._method_info[1]))
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/encrypt.py", line 109, in get_cipher
    return m[2](method, key, iv, op)
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/crypto/openssl.py", line 76, in __init__
    load_openssl()
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/crypto/openssl.py", line 52, in load_openssl
    libcrypto.EVP_CIPHER_CTX_cleanup.argtypes = (c_void_p,)
  File "/usr/lib/python2.7/ctypes/__init__.py", line 379, in __getattr__
    func = self.__getitem__(name)
  File "/usr/lib/python2.7/ctypes/__init__.py", line 384, in __getitem__
    func = self._FuncPtr((name_or_ordinal, self))
AttributeError: /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1: undefined symbol: EVP_CIPHER_CTX_cleanup
```

according to [https://blog.csdn.net/blackfrog_unique/article/details/60320737](https://blog.csdn.net/blackfrog_unique/article/details/60320737), more details: [https://github.com/shadowsocks/shadowsocks/pull/947/files](https://github.com/shadowsocks/shadowsocks/pull/947/files)

try to change the source code of shadowsocks

```
root@vultr:~# vim /usr/local/lib/python2.7/dist-packages/shadowsocks/crypto/openssl.py
```

```
- libcrypto.EVP_CIPHER_CTX_cleanup
+ libcrypto.EVP_CIPHER_CTX_reset
```

try to start again

```
vim /etc/rc.local
chmod +x /etc/rc.local
```

```
/usr/bin/python /usr/local/bin/ssserver -c /etc/shadowsocks.json -d start
```


## See also

- [shadowsocks](/shadowsocks.html)