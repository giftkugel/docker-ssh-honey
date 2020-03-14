#!/bin/sh
/bin/ssh-honeypot -r /var/ssh-honeypot.rsa -l /var/log/ssh-honeypot.log -p 22 -u nobody
echo "SSH Honeypot is Running..."
exec "$@"
