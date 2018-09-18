# specify the node base image with your desired version node:<version>
FROM node:8
ENV NODE_PORT=8080
ENV ROOT_PASSWD=rootroot

# install node basic enviorment
RUN npm -g install nrm \
    && nrm use taobao \
    && npm -g install npm \
    && npm -g install cnpm

# install ssh server from apt
COPY sources.list /etc/apt/
RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y install openssh-server
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo 'root:${ROOT_PASSWD}' |chpasswd
ADD id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh/authorized_keys
RUN apt-get autoclean && apt-get autoremove
RUN mkdir -p /var/run/sshd

EXPOSE 22
EXPOSE ${NODE_PORT}
CMD ["usr/sbin/sshd","-D"]




