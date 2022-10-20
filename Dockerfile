FROM --platform=linux/amd64 tomcat:8.5.47-jdk8-openjdk

COPY StudentSurvey.war /usr/local/tomcat/webapps
