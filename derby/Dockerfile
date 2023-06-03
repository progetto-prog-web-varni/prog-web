FROM eclipse-temurin:17.0.7_7-jre-alpine

LABEL "website.name"="programmazione-web"
LABEL "github-repo"="programmazione-web/prog-web"
LABEL "creator.name"="github.com/giovannifoletto"
LABEL "descr"="Runner for derby network, to not install on my computer and KIS (Keep It Simple)"

RUN apk add --no-cache wget
RUN apk add --no-cache unzip
RUN apk add --no-cache busybox

WORKDIR /tmp/derby
RUN wget https://archive.apache.org/dist/db/derby/db-derby-10.14.2.0/db-derby-10.14.2.0-lib.zip -O /tmp/derby/db-derby-10.14.2.0-lib.zip
# RUN echo "ffc0c4f40e798fc783474cbcf22b9504a707532575dfe439011ebcf4bb678e05e6444cefafb51d3ee9e568da5c33d11b9e960e8a072571db59dde1230c2f96eb" > /tmp/derby_sha
# sha256sum ffc0c4f40e798fc783474cbcf22b9504a707532575dfe439011ebcf4bb678e05e6444cefafb51d3ee9e568da5c33d11b9e960e8a072571db59dde1230c2f96eb
# RUN sha256sum /tmp/derby/db-derby-10.16.1.1-lib.zip | cut -d" " -f1

RUN mkdir /derby
RUN unzip /tmp/derby/db-derby-10.14.2.0-lib.zip
RUN mv /tmp/derby/db-derby-10.14.2.0-lib/* /derby

WORKDIR /derby/lib
# From Docs.
# export CLASSPATH=$DERBY_INSTALL/lib/derby.jar:
# $DERBY_INSTALL/lib/derbytools.jar:
# $DERBY_INSTALL/lib/derbyoptionaltools.jar:
# $DERBY_INSTALL/lib/derbyshared.jar:.
ENV CLASSPATH=/derby/lib/derby.jar
ENV CLASSPATH=/derby/lib/derbytools.jar
ENV CLASSPATH=/derby/lib/derbyoptionaltools.jar
ENV CLASSPATH=/derby/lib/derbyshared.jar

# Sysinfo
# RUN java org.apache.derby.tools.sysinfo

EXPOSE 1527

CMD ["java", "-jar", "/derby/lib/derbyrun.jar", "server", "start"]

#CMD ["/derby/bin/startNetworkServer"]
