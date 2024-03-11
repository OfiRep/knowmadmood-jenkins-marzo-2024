pipeline {
    agent any

    options {
        buildDiscarder(logRotator(numToKeepStr: '7',
                                  daysToKeepStr: '10'))
        timestamps()
    }

    parameters{
        string(name: 'VERSION', defaultValue: 'SNAPSHOT',
        description: 'version de la app que queremos desplegar')
    }

    stages{
        stage('Clean WorkSpace'){
            steps {
                cleanWs()
            }
        }

        stage('Maven Verify'){
            steps {
                println "mvn verify"
            }
        }

        stage('Maven Test'){
            steps {
                println "mvn test"
            }
        }

        stage('Maven Install'){
            steps {
                println "mvn install"
            }
        }

        stage('Create file'){
            steps {
                sh 'touch file1.txt'
            }
        
        }
        stage('Create custom file'){
            steps {
                sh 'touch file-$VERSION.txt'
            }
        }
    }

  /*  post {

        always {
            ChuckNorris()
        }

        success {

        }

        failure {

        }

        aborted {

        } 
    }*/

}
