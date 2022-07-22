FROM ubuntu:16.04
#FROM openjdk:11

# Install Docker CLI in the agent
RUN apt-get update 

RUN apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common

#RUN curl -fsSL https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu/gpg |apt-key add -

#RUN add-apt-repository "deb [arch=$(dpkg --print-architecture)] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu $(lsb_release -cs) stable"

#RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

#RUN add-apt-repository "deb [arch=$(dpkg --print-architecture)] https://mirrors.tuna.tsinghua.edu.cn/ubuntu $(lsb_release -cs) stable"

#RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

#RUN add-apt-repository "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"


#RUN add-apt-repository ppa:linuxuprising/java

#RUN add-apt-repository https://pypi.tuna.tsinghua.edu.cn/simple/ 
#RUN add-apt-repository https://mirrors.aliyun.com/pypi/simple/ 

RUN apt-get update

RUN apt-get upgrade 


#RUN apt-get install -y oracle-java11-set-default-local

#RUN apt-get install -y docker-ce 

#RUN apt-get update && apt-get install -y docker-ce --allow-unauthenticated

RUN apt-get install -y python

RUN apt-get install -y python-pip

#RUN python -m ensurepip
#RUN easy_install pip

#RUN python -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip


#RUN apt-get update && apt-get upgrade && apt-get install -y python-pip

RUN apt-get install -y git 

RUN add-apt-repository ppa:openjdk-r/ppa

RUN apt-get update && apt-get install -y openjdk-11-jre


RUN pip install requests==2.8.1

RUN pip install pbr

RUN pip install python-jenkins

# Get docker-compose in the agent container
#RUN curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

RUN mkdir -p /home/jenkins

RUN mkdir -p /var/lib/jenkins

# Start-up script to attach the slave to the master
ADD slave.py /var/lib/jenkins/slave.py

WORKDIR /home/jenkins

VOLUME /opt/coverity


ENV JENKINS_URL "http://jenkins"
ENV JENKINS_SLAVE_ADDRESS ""
ENV JENKINS_USER "admin"
ENV JENKINS_PASS "admin"
ENV SLAVE_NAME ""
ENV SLAVE_SECRET ""
ENV SLAVE_EXECUTORS "1"
ENV SLAVE_LABELS "docker"
ENV SLAVE_WORING_DIR ""
ENV CLEAN_WORKING_DIR "true"


CMD [ "python", "-u", "/var/lib/jenkins/slave.py" ]
