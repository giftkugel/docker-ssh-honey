FROM alpine:3.6
RUN apk add --no-cache git libssh-dev screen gcc musl-dev nano openssl build-base bash openssh
RUN git clone https://github.com/droberson/ssh-honeypot.git
WORKDIR /ssh-honeypot/
RUN make
RUN ssh-keygen -t rsa -f ./ssh-honeypot.rsa
RUN chmod 777 /ssh-honeypot/bin/ssh-honeypot
RUN mv /ssh-honeypot/bin/ssh-honeypot /bin/ssh-honeypot
EXPOSE 22
ADD entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
