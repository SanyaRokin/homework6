FROM ubuntu:20.04
RUN apt -y update && apt -y install openjdk-8-jdk wget && apt install git -y && apt install maven -y
RUN mkdir /usr/local/tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.46/bin/apache-tomcat-9.0.46.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.46 /usr/local/tomcat/
RUN cd /home
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /home/boxfuse-sample-java-war-hello
WORKDIR /home/boxfuse-sample-java-war-hello
RUN mvn package
RUN cp /home/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/apache-tomcat-9.0.46/webapps
CMD ["/usr/local/tomcat/apache-tomcat-9.0.46/bin/catalina.sh", "run"]
