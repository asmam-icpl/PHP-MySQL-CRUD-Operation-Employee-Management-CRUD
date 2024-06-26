pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from your Git repository
                git ' https://github.com/asmam-icpl/PHP-MySQL-CRUD-Operation-Employee-Management-CRUD.git'
            }
        }

        stage('Run TruffleHog') {
            steps {
                // Run TruffleHog to detect secrets
                sh 'trufflehog --json https:// https://github.com/asmam-icpl/PHP-MySQL-CRUD-Operation-Employee-Management-CRUD.git > trufflehog_output.json'
            }
        }

        stage('Post-Processing') {
            steps {
                // Check the TruffleHog output and process results
                script {
                    def output = readFile('trufflehog_output.json')
                    if (output.contains('Reason')) {
                        // Fail the build if secrets are found
                        error('Secrets detected by TruffleHog!')
                    }
                }
            }
        }

        stage('SonarQube Analysis') {
            steps {
                // Perform SonarQube
