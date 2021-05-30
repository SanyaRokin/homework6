FROM tomcat:9.0
RUN apt update        
RUN apt install git -y 
RUN apt install default-jdk -y
RUN apt install maven -y
RUN cd /home
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /home/boxfuse-sample-java-war-hello
WORKDIR /home/boxfuse-sample-java-war-hello
RUN mvn package
RUN cp /home/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps
