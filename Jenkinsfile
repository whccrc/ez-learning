appName = "ezlearning"

pipeline {

    agent any

    stages {
   
        stage('Git Pull') {
            steps {
            git url: 'https://github.com/a-dhaou/ez-learning'   
                  }
                          }

        stage('Maven BUild') {
            steps {
                 withMaven(maven: 'maven3_8') {
                    sh "mvn clean package"    
                                              }
                   }    
                             }
        stage('SonarQube analysis') {
    withSonarQubeEnv(cinstallationName: 'sonarqube4_7') { 
      sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.9.1.2184:sonar'
    }
  }

        stage('Docker Image Build') {
            steps { 
                script{
                    openshift.withCluster() {
                    openshift.withProject("project1") {
                   // bc = build configuration ...
                   def build = openshift.selector('bc', 'ezlearning').startBuild("--from-dir .")
                   build.logs('-f')
               }
           }
               
            }
                  }
    }
        
    }//stages
           }//pipeline
