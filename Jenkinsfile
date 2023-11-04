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
                       sh "mvn clean package --quiet -Dmaven.repo.local=/var/jenkins_home/.m2/repository"
                                             } 

                  }
        }

stage('Docker Image Build') {
    steps {
        script {
            echo "Starting Docker Image Build"
            openshift.withCluster() {
                sh "eval $(crc oc-env)"
                echo "Inside withCluster block"
                openshift.withProject("project1") {
                    echo "Inside withProject block"
                    def build = openshift.selector('bc', 'ezlearning').startBuild("--from-dir .")
                    echo "Build started"
                }
            }
        }
    }
}


  //end docker image build      
               }//stages
           }//pipeline
