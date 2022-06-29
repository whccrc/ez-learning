pipeline {
    agent any

    stages {
        stage('git chekout') {
            steps {
                git 'https://github.com/a-dhaou/ez-learning.git'
            }
        }
        
        stage('build') {
            steps {
            git url: 'https://github.com/a-dhaou/ez-learning'
                 withMaven(maven: 'maven3_8') {
                    
                    sh "mvn clean verify"
                     
                 }
            }
            
        }
    }
    
}
