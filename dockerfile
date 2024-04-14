FROM ubuntu:latest

RUN apt-get update -y \
  && apt-get install -y openssh-server git vim htop sudo \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN yes | unminimize

RUN echo "root:demo" | chpasswd
RUN echo "PermitRootLogin Yes" >> /etc/ssh/sshd_config

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV VISUAL=/usr/bin/vim

CMD ["bash"]
ENTRYPOINT ["/entrypoint.sh"]
