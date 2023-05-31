FROM tomcat:8.5.89-jre17-temurin
# docker pull tomcat:8.5.89-jre17-temurin

COPY target /usr/local/tomcat/webapps

WORKDIR /usr/local/tomcat/

# CMD ["catalina.sh", "run"]