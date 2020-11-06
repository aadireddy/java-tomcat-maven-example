FROM openjdk:8
EXPOSE 8080
WORKDIR /var/lib/jenkins/workspace/devops/target/dependency/webapp-runner.jar
ENTRYPOINT ["java","-jar","webapp-runner.jar']
