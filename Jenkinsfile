
appName = "ezlearning"

pipeline {

    agent { dockerfile true }

    stages {
        
        stage('Git Pull') {
            steps {
            git url: 'https://github.com/a-dhaou/ez-learning'   
                  }
                          }

        stage('Maven BUild') {
            steps {
                 withMaven(maven: 'maven3_8') {
                    sh "mvn clean verify"    
                                              }
                   }    
                          }

        stage('Docker image Build') {
   steps {
       script {
             def myEnv = docker.build 'my-environment:snapshot'
             myEnv.inside {
                sh 'make test'
                }
                }
                }
}

    }//stages
           }
    
