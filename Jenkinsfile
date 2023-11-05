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
                       sh "mvn clean package --quiet -Dmaven.repo.local=/var/lib/jenkins/.m2/repository"
                                             } 

                  }
        }

stage('SonarQube analysis') {
    steps {
        script {
            def mavenRepoLocal = '/var/lib/jenkins/.m2/repository'
            withMaven(maven: 'maven3_8') {
                withSonarQubeEnv('sonarqube') {
                    sh "mvn sonar:sonar -Dsonar.projectKey=ezsonar"
                }
            }
        }
    }
}
//stage
      
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



  //end docker image build      
               }//stages
           }//pipeline
