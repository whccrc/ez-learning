appName = "ezlearning"

pipeline {
    environment {
     dockerHome = tool 'dockerinstall'
   }

    agent { dockerfile true }

    stages {
        
        stage('Initialize'){
            steps{
                env.PATH = "${dockerHome}/bin:${env.PATH}"
            }
        }
        
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

        stage('Docker Image Build') {
      agent { dockerfile true }
      steps {
        sh 'docker build -t app.jar:latest .'
      }
    }

    }//stages
           }
    
