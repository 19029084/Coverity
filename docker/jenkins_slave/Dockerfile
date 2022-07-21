FROM ubuntu:16.04

# Install Docker CLI in the agent
RUN apt-get update 
#&& apt-get install -y apt-transport-https ca-certificates
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg |sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


RUN apt-get update
RUN apt-get install docker-ce



#RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
#RUN echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" > /etc/apt/sources.list.d/docker.list
#RUN apt-get update && apt-get install -y docker-ce --allow-unauthenticated

RUN apt-get install -y software-properties-common



RUN add-apt-repository ppa:openjdk-r/ppa

RUN apt-get update 

RUN apt-get install -y openjdk-11-jdk curl python  python-pip  git gcc 

#RUN pip3 install chardet==3.0.4

RUN pip install requests==2.8.1
RUN pip install pbr
RUN pip install python-jenkins

#RUN pip3 install jenkins-webapi

# Get docker-compose in the agent container
RUN curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
RUN mkdir -p /home/jenkins
RUN mkdir -p /var/lib/jenkins

# Start-up script to attach the slave to the master
ADD slave.py /var/lib/jenkins/slave.py

WORKDIR /home/jenkins

VOLUME /opt/coverity

ADD cov-analysis-linux64-2021.06.tar.gz /home/jenkins

RUN tar -xzf /home/jenkins/cov-analysis-linux64-2021.06.tar.gz

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
