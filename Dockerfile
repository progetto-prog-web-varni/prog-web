FROM tomcat:latest

COPY target /usr/local/tomcat/webapps

WORKDIR /usr/local/tomcat/

# CMD ["catalina.sh", "run"]