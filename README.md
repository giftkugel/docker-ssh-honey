# SSH Honeypot

This SSH Honeypot is based on the work from https://github.com/droberson/ssh-honeypot and https://github.com/random-robbie/docker-ssh-honey.

The image size is around 8MB.

```bash
REPOSITORY                           TAG                 IMAGE ID            CREATED             SIZE
giftkugel/ssh-honeypot               latest              3f9d9bdc6ff1        15 minutes ago      7.92MB
```

## Note

Change the Port of your SSH server from 22 to something else.

## Start

Maybe you need to start the docker container as root or a privileged user to bind port 22.

```bash
docker run -it -p 22:22 giftkugel/ssh-honeypot:latest
```

The logs are written to stdout and `/var/logs/ssh-honeypot.log`.

Mount the file as volume to keep it outside the Docker container.


## Logs

The logs will look like

```bash
[Sat Mar 14 21:14:38 2020] ssh-honeypot 0.1.0 by Daniel Roberson started on port 22. PID 6
[Sat Mar 14 21:14:48 2020] Session:  SSH-2.0-MoTTY_Release_0.36|SSH-2.0-OpenSSH_5.9p1 Debian-5ubuntu1.4|(null)|aes256-ctr|aes256-ctr|hmac-sha2-256|hmac-sha2-256
[Sat Mar 14 21:14:51 2020] 172.17.0.1 test 12345
[Sat Mar 14 21:14:53 2020] 172.17.0.1 test test
[Sat Mar 14 21:14:54 2020] 172.17.0.1 test god
[Sat Mar 14 21:14:56 2020] 172.17.0.1 test dede
[Sat Mar 14 21:14:57 2020] 172.17.0.1 test eas
[Sat Mar 14 21:14:58 2020] 172.17.0.1 test 124
[Sat Mar 14 21:14:59 2020] 172.17.0.1 test 2121
[Sat Mar 14 21:15:00 2020] 172.17.0.1 test dede
```
