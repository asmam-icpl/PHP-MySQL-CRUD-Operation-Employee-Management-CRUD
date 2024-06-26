pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'sub', url:'https://your-git-repository-url.git'
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

        stage('Post-Processing') {
            steps {
                script {
                    def output = readFile('trufflehog_output.json')
                    if (output.contains('Reason')) {
                        error('Secrets detected by TruffleHog!')
                    }
                }
            }
        }

        stage('Cleanup') {
            steps {
                deleteDir()
            }
        }
    }
}
