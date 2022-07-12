library identifier: "pipeline-library@master", retriever: modernSCM(
  [$class: "GitSCMSource",
   remote: "https://github.com/redhat-cop/pipeline-library.git"])
   appName = "ezlearning"
pipeline {
    agent any

   
        
        stage('Maven BUild') {
            steps {
            git url: 'https://github.com/a-dhaou/ez-learning'
                 withMaven(maven: 'maven3_8') {
                    
                    sh "mvn clean verify"
                     
                 }
            }
            
        }



        stage('Docker Build') {
            steps {
                // This uploads your application's source code and performs a binary build in OpenShift
                // This is a step defined in the shared library (see the top for the URL)
                // (Or you could invoke this step using 'oc' commands!)
                binaryBuild(buildConfigName: appName, buildFromPath: ".")
            }
        }





    }
    
}
