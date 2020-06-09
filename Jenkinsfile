node{
    stage('scm checkout'){
       git 'https://github.com/aadireddy/java-tomcat-maven-example.git'
    }
    stage('build'){
        def mvnHome = tool name: 'maven', type: 'maven'
        def mvnCMD = "${mvnHome}/bin/mvn"
        sh "${mvnCMD} clean package"
    }
}
