FROM debian:latest
MAINTAINER Tom Xiong <tomxiongzh@gmail.com>

# Install packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install openssh-server pwgen
RUN mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config
ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

EXPOSE 80
EXPOSE 443
EXPOSE 8080
EXPOSE 8089
EXPOSE 1080
EXPOSE 22
EXPOSE 21
EXPOSE 25
EXPOSE 23
EXPOSE 366
EXPOSE 53
EXPOSE 54
EXPOSE 4443
CMD ["/run.sh"]
