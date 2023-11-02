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
stage('SonarQube analysis') {
    steps {
        script {
            def mavenRepoLocal = '/var/jenkins_home/.m2/repository'
            withMaven(maven: 'maven3_8') {
                withSonarQubeEnv('sonarqube') {
                    sh "mvn -Dmaven.repo.local=${mavenRepoLocal} sonar:sonar -Dsonar.projectKey=ezsonar"
                }
            }
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
                                                       }
                                             }           
                        }
                     }
                                   }
        
               }//stages
           }//pipeline
