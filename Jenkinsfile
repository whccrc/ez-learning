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
    def scannerHome = tool 'sonarqube4_7';
    withSonarQubeEnv('sonarqube4_7') {
      sh "${scannerHome}/bin/sonar-scanner \
      -D sonar.login=admin \
      -D sonar.password=admin \
      -D sonar.projectKey=ezsonar \
      -D sonar.exclusions=vendor/**,resources/**,**/*.java \
      -D sonar.host.url=https://sonarqube.project1.svc.cluster.local:9000"
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
