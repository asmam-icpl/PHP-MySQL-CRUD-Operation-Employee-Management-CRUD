pipeline {
    agent any

    stages {
         stage('Checkout') {
             steps {
                 git branch: 'main', url:' https://github.com/asmam-icpl/PHP-MySQL-CRUD-Operation-Employee-Management-CRUD.git'
             }
         }

        stage('Run TruffleHog') {
            steps {
                // bat pip install trufflehog
                // bat 'trufflehog --json  git https://github.com/asmam-icpl/PHP-MySQL-CRUD-Operation-Employee-Management-CRUD.git > trufflehog_output.json'
                bat 'docker pull trufflesecurity/trufflehog '
                bat 'docker run trufflesecurity/trufflehog --json git https://github.com/asmam-icpl/PHP-MySQL-CRUD-Operation-Employee-Management-CRUD.git > trufflehog_output.json'
                //bat 'echo  "${BUILD_NUMBER}${WORKSPACE}/trufflehog_output.json"
                echo "Workspace directory: ${WORKSPACE}"
                echo "Build number: ${BUILD_NUMBER}"
                //ehco ${WORKSPACE}/trufflehog_output.json
            }
        }

        // stage('SonarQube Analysis') {
        //     steps {
        //         script {
        //             def scannerHome = tool 'SonarScanner'
        //             withSonarQubeEnv('SonarQube') {
        //                 bat "${scannerHome}/bin/sonar-scanner"
        //             }
        //         }
        //     }
        // }

        // stage('Post-Processing') {
        //     steps {
        //         script {
        //             def output = readFile('trufflehog_output.json')
        //             if (output.contains('Reason')) {
        //                 error('Secrets detected by TruffleHog!')
        //             }
        //         }
        //     }
        // }

        stage('Cleanup') {
            steps {
                deleteDir()
            }
        }
    }
}
