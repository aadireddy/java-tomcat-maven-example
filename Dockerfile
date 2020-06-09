FROM tomcat

ARG CONT_IMG_VER
WORKDIR /usr/local/tomcat
EXPOSE 8080
COPY ./target/java-tomcat-maven-example.war /usr/local/tomcat/webapps
