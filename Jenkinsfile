pipeline {
    agent { 
        label 'minion2'
    }
     options { 
        buildDiscarder(logRotator(numToKeepStr: '7', daysToKeepStr: '10'))
        timestamps()
    }

    parameters {
        string (name: 'VERSION', description: 'La versión de la aplicación que queremos desplegar', trim: true, defaultValue: 'SNAPSHOT')
    }

    stages {
        stage('Clean workspace') {
            steps {
                println "Deleting workspace..."
                cleanWs()
            }
        }
        stage('mvn verify') {
            steps {
                println "mvn verify"
            }
        }

        stage('mvn Test') {
            steps {
                println "mvn test"
            }
        }

        stage('mvn install') {
            steps {
                println "mvn install"
            }
        }
        
        stage('Create file') {
            steps {
                println "Creando file1.txt..."
                sh 'touch file1.txt'
            }
        }

        stage('Create param file') {
            steps {
                println "Creando file con param..."
                sh 'touch file-"$VERSION".txt'
            }
        }  
    }

    // 
    post {
        always {
            // se ejecuta siempre en esta fase de post
            chuckNorris()
        }
        // success {
            // solo se ejecuta esto si todos los stages han sido success
        // }

        // failure {
            // se ejecuta si ha habido fallos 
        // }

        // abort {

        // }
    }
}