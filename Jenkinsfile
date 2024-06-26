pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://your-git-repository-url.git'
            }
        }

        stage('Run TruffleHog') {
            steps {
                sh 'trufflehog --json https://your-git-repository-url.git > trufflehog_output.json'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool 'SonarScanner'
                    withSonarQubeEnv('SonarQube') {
                        bat "${scannerHome}/bin/sonar-scanner"
                    }
                }
            }
        }
