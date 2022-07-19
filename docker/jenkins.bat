docker pull jenkins/jenkins
docker run -d -uroot -p 9095:9095 -p 50000:50000 -p 8080:8080 --name jenkins -v ./jenkins_home:/var/jenkins_home jenkins/jenkins
