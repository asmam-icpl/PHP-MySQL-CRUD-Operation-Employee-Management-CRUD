 pipeline {
    agent any

    stages {
        stage('SCM Checkout') {
            steps {
                checkout scm
            }
        }
        
        // stage('SonarQube Analysis') {
        //     steps {
        //         script {
        //             def scannerHome = tool name: 'SonarScanner'
        //             withSonarQubeEnv('SonarQubeServer') {
        //                 bat "${scannerHome}\\bin\\sonar-scanner"
        //             }
        //         }
        //     }
        // }
        
        stage('Git Scanning') {
            steps {
                script {
                    def outputFilePath = "${env.WORKSPACE}\\trufflehog_output.json"
                    
                    // Pull the latest TruffleHog Docker image
                    bat 'docker pull trufflesecurity/trufflehog'
                    
                    // Run TruffleHog and save the output to a file in the workspace
                    bat "docker run --rm trufflesecurity/trufflehog --json git https://github.com/trufflesecurity/trufflehog.git > ${outputFilePath}"
                    
                    // Print the path of the output file
                    echo "The TruffleHog output file is located at: ${outputFilePath}"
                    
                    // Optionally, read the file content and print it (for debugging purposes)
                    //bat "type ${outputFilePath}"

                    
                }
            }
        }
    stage('workspace file'){
            steps
            {
                //echo "${env.JENKINS_URL}job/${env.JOB_NAME}/ws/trufflehog_output.json"
                echo "${env.JENKINS_URL}job/${env.JOB_NAME}/${env.BUILD_NUMBER}/execution/node/3/ws/*zip*/trufflehog_output.json"

            }
        }    
    }
}
