pipeline {
    agent any

    stages {
         stage('Checkout') {
             steps {
                 git branch: 'main', url:' https://github.com/trufflesecurity/trufflehog.git'
             }
         }

        stage('Run TruffleHog') {
            steps {
                bat 'docker pull trufflesecurity/trufflehog '
                bat 'docker run trufflesecurity/trufflehog --json git https://github.com/trufflesecurity/trufflehog.git > trufflehog_output.json'
                echo "Workspace directory: ${WORKSPACE}"
                echo "Build number: ${BUILD_NUMBER}"
            }
        }

         stage('SonarQube Analysis') {
        def scannerHome = tool 'SonarScanner';
          withSonarQubeEnv() {
          bat "${scannerHome}/bin/sonar-scanner"
    }
  }


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

        // stage('Cleanup') {
        //     steps {
        //         deleteDir()
        //     }
        // }
    }
}
