appName = "ezlearning"

pipeline {

    agent any

    stages {
   
        stage('Git Pull') {
            steps {
            git url: 'https://github.com/a-dhaou/ez-learning'   
                  }//steps git
                          }//stage git

        stage('Maven BUild') {
            steps {
                
                 withMaven(maven: 'maven3_8') {
                    sh "mvn clean package "    
                                              }//with maven
                   }//steps mvn build
            
                             }//stage mvn build
stage('Test') {
            steps {withMaven(maven: 'maven3_8') {
                sh 'mvnm test'}//withmaven
            }//steps

            post {
                always {
                    junit '**/target/surefire-reports/TEST-*.xml'
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
               }//ocwithproject
           }//ocwithcluster
               
            }//script
                  }//steps
    }//stagedocker
        
    }//stages
           }//pipeline
