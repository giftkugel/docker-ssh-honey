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
