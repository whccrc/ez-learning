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
    steps {
        script {
            def customUserHome = '/var/jenkins_home/.sonar_custom_cache'
            withMaven(maven: 'maven3_8') {
                withSonarQubeEnv('sonarqube') {
                    sh "mvn - sonar:sonar -Dsonar.userHome=${customUserHome} -Dsonar.projectKey=ezsonar"
                }
            }
        }
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
