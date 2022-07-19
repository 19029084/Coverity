FROM alpine:latest
MAINTAINER WEIJIAN

RUN apk update && apk upgrade
RUN apk --no-cache add ca-certificates

RUN apk add bash bash-doc bash-completion
RUN apk add vim wget curl net-tools

RUN apk add --no-cache openssh-server tzdata && \
	cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
	sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
	ssh-keygen -t rsa -P "" -f /etc/ssh/ssh_host_rsa_key && \
	ssh-keygen -t ecdsa -P "" -f /etc/ssh/ssh_host_ecdsa_key && \
	ssh-keygen -t ed25519 -P "" -f /etc/ssh/ssh_host_ed25519_key && \
	echo "root:admin" |chpasswd 

RUN apk add openjdk8

RUN rm -rf /var/cache/apk/*

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk/
ENV PATH=$PATH:$JAVA_HOME/bin


ADD .bashrc /root/
RUN echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/' >>/root/.bashrc
RUN echo 'export PATH=$PATH:$JAVA_HOME/bin' >>/root/.bashrc

EXPOSE 22


CMD ["/usr/sbin/sshd","-D"]