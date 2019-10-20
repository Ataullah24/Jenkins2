FROM ubuntu
 
RUN apt-get update && \
    apt-get install -y openssh-server

RUN useradd remote_user && \
    echo remote_user:"1234" | chpasswd && \
    mkdir -p /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user   -R /home/remote_user && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

RUN mkdir -p -m0755 /var/run/sshd


RUN apt-get install -y mysql-server

RUN apt-get install -y python3-pip && \
    pip3 install --upgrade pip && \
    python3 -m pip install awscli && \
    aws --version
 
CMD /usr/sbin/sshd -D
