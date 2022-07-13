
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


        stage('Docker image Build') {
   steps {
       script {
           openshift.withCluster() {
               openshift.withProject("project1") {
                   // bc = build configuration ...
                   def build = openshift.selector('bc', 'ezlearning').startBuild()
                   build.logs('-f')
               }
           }
       }
   }
}

    }
    }
    
