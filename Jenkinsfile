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
                       sh "mvn clean package -Dmaven.repo.local=/var/jenkins_home/.m2/repository"
                                             } 

                  }
        }

        stage('Docker Image Build') {
            steps { 
                script{
                              echo "Starting Docker Image Build"
                    openshift.withCluster(api-crc-testing:6443) {
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
