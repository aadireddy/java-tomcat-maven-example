FROM ubuntu
EXPOSE 8080
WORKDIR ./target/java-tomcat-maven-example.war
ENTRYPOINT ["java","-jar","java-tomcat-maven-example.war"]
