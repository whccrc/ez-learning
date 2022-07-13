
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
                    
                    sh "mvn clean verify"
                     
                 }
            }
            
        }


        stage('Docker Build in dev') {
   steps {
       script {
           openshift.withCluster() {
               openshift.withProject("attempt5") {
                   // bc = build configuration ...
                   def build = openshift.selector('bc', 'attempt-at-depconf').startBuild("--from-dir .")
                   build.logs('-f')
               }
           }
       }
   }
}


        




    }
    }
    
