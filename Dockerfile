#FROM tomcat:8.0.20-jre8
FROM tomcat:8.5.82-jre8-openjdk-slim
EXPOSE 8080
COPY target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
