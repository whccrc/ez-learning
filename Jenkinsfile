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
                    sh "mvn clean package sonar:sonar"    
                                              }
                   }
            
                             }
        
        stage('SonarQube analysis') {
            steps {
                script {
    def scannerHome = tool 'sonarqube';
    withSonarQubeEnv('sonarqube') {
      sh "${scannerHome}/bin/sonar-scanner \
      -D sonar.projectKey=ezsonar \
      -D sonar.exclusions=vendor/**,resources/**,**/*.java \
      -Dsonar.host.url=https://sonarqube-project1.apps-crc.testing \
      -Dsonar.login=c652e392ba1598d50db1dea0183b735ea99dc10d \
    }//withenv
  }//script
}//steps
        }//stage

        

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
