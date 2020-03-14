FROM alpine:latest AS build
RUN apk add --no-cache git libssh-dev json-c-dev make gcc clang clang-dev musl-dev openssh
RUN git clone https://github.com/droberson/ssh-honeypot.git \
&& cd ssh-honeypot \
&& make \
&& ssh-keygen -t rsa -f /var/ssh-honeypot.rsa \
&& chmod u+x /ssh-honeypot/bin/ssh-honeypot \
&& mv /ssh-honeypot/bin/ssh-honeypot /bin/ssh-honeypot

FROM alpine:latest
RUN apk add --no-cache libssh-dev json-c
COPY --from=build /bin/ssh-honeypot /bin/ssh-honeypot
COPY --from=build /var/ssh-honeypot.rsa /var/ssh-honeypot.rsa

RUN rm -f /sbin/apk \
&& rm -rf /etc/apk \
&& rm -rf /lib/apk \
&& rm -rf /usr/share/apk \
&& rm -rf /var/lib/apk \
&& rm -fr /var/spool/cron \
&& rm -fr /etc/crontabs \
&& rm -fr /etc/periodic \
&& rm -fr /etc/init.d \
&& rm -fr /lib/rc \
&& rm -fr /etc/conf.d \
&& rm -fr /etc/inittab \
&& rm -fr /etc/runlevels \
&& rm -fr /etc/rc.conf \
&& rm -fr /etc/sysctl* \
&& rm -fr /etc/modprobe.d \
&& rm -fr /etc/modules \
&& rm -f /etc/fstab

EXPOSE 22
ADD entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]