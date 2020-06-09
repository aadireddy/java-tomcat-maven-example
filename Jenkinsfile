node{
    stage('scm checkout'){
       git 'https://github.com/aadireddy/java-tomcat-maven-example.git'
    }
    stage('build'){
        def mvnHome = tool name: 'maven', type: 'maven'
        def mvnCMD = "${mvnHome}/bin/mvn"
        sh "${mvnCMD} clean package"
    }
    stage('nexus artifacts'){
    nexusPublisher nexusInstanceId: '1234', nexusRepositoryId: 'releases', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: '/var/lib/jenkins/workspace/java-tomcat-maven-example/target/java-tomcat-maven-example.war']], mavenCoordinate: [artifactId: 'java-tomcat-maven-example', groupId: 'com.example', packaging: 'jar', version: '$BUILD_NUMBER']]]
    }
    stage('build docker image'){
        sh 'docker build -t aadireddy/java-tomcat-maven-example:$BUILD_NUMBER .'
    }
    stage('push docker image'){
        sh label: '', script: '''docker tag aadireddy/java-tomcat-maven-example:$BUILD_NUMBER docker.io/aadireddy/java-tomcat-maven-example:$BUILD_NUMBER
                                 docker push docker.io/aadireddy/devcenter:$BUILD_NUMBER'''
    }
    stage('update image version'){
        sh label: '', script: '''sed -i s/latest/$BUILD_NUMBER/ kubernetes-deploy.yaml'''    
    }
    stage('deploy to kubernetes'){
        kubernetesDeploy(
        configs: 'kubernetes-deploy.yaml',
        kubeconfigId: 'k8s_config',
        enableConfigSubstitution: true
        )
    }
}
