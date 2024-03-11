pipeline {
    agent{
        label 'minion'
    }

    options{
        buildDicarter(logRotator(numToKeepStr: '7', daysToKeepStr: '10'))
    }

    parameters{
        string(name: 'VERSION', defaultValue: 'RC',description: 'la version de la pp que vamos a desplegas')
    }
/*
    stages {
        stage ('limpiar WorkSpace') { 
            steps {
                cleanWs()
            }
        }
    }
    */
}
