FROM tomcat:8.5.89-jre17-temurin

# common.loader="${catalina.base}/lib","${catalina.base}/lib/*.jar","${catalina.home}/lib","${catalina.home}/lib/*.jar"

RUN apt install wget
RUN wget https://github.com/javaee/javamail/releases/download/JAVAMAIL-1_6_2/javax.mail.jar -O /usr/local/tomcat/lib/javax.mail.jar

COPY target /usr/local/tomcat/webapps

WORKDIR /usr/local/tomcat/

# CMD ["catalina.sh", "run"]