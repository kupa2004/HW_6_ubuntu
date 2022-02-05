FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install default-jdk -y default-jdk
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.58/bin/apache-tomcat-9.0.58.tar.gz /home/
WORKDIR /usr/local/src
ADD apache-tomcat-9.0.58.tar.gz /usr/local/src
RUN mv apache-tomcat-9.0.58/ /usr/local/tomcat9
RUN apt-get install maven -y maven
RUN apt-get install git -y git
WORKDIR /home
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR target
RUN cp hello-1.0.war /usr/local/tomcat9/webapps
EXPOSE 8080
ENTRYPOINT ["/usr/local/tomcat9/bin/catalina.sh","run"]
CMD []