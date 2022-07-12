
   appName = "ezlearning"
pipeline {
    agent any

   
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
            steps {
                // This uploads your application's source code and performs a binary build in OpenShift
                // This is a step defined in the shared library (see the top for the URL)
                // (Or you could invoke this step using 'oc' commands!)
                binaryBuild(buildConfigName: appName, buildFromPath: ".")
            }
        }//





    }
    
}
