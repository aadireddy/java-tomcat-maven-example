FROM openjdk:8
EXPOSE 8080
ADD ./target/webapp-runner.jar webapp-runner.jar
ENTRYPOINT ["java","-jar","webapp-runner.jar']
