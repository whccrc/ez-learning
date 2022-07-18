appName = "ezlearning"

pipeline {
    tools {
  dockerTool 'dockerinstall'
}
    //environment {
     //dockerHome = tool 'dockerinstall'
   //}

    agent {
        docker { image 'node:17.09.1-ce' }
    }

    stages {
        
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
       stage('Initialize'){
            steps{
                script {
                dockerHome = tool 'dockerinstall'
                env.PATH = "${dockerHome}/bin:${env.PATH}"
                }
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
            steps { script{
                
          def myEnv = docker.build 'app.jar:snapshot'
               
            }
                  }
    }
//stage('Docker Build') {
    //  agent any
      //steps {
      //  sh 'docker build -t ezlearning:latest .'
    //  }
   // }
        
        //stage ('push image to registry')https://gist.github.com/bruno-brant/b4d4935cb33828f48d18078c294eb12b
    }//stages
           }
