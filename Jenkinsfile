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
        
        // stage('Git Scanning') {
        //     steps {
        //         script {
        //             def outputFilePath = "${env.WORKSPACE}\\trufflehog_output.json"
                    
        //             // Pull the latest TruffleHog Docker image
        //             bat 'docker pull trufflesecurity/trufflehog'
                    
        //             // Run TruffleHog and save the output to a file in the workspace
        //             bat "docker run --rm trufflesecurity/trufflehog --json git https://github.com/trufflesecurity/trufflehog.git > ${outputFilePath}"
                    
        //             // Print the path of the output file
        //             echo "The TruffleHog output file is located at: ${outputFilePath}"
                    
        //             // Optionally, read the file content and print it (for debugging purposes)
        //             //bat "type ${outputFilePath}"

                    
        //         }
        //     }
        // }
    // stage('workspace file'){
    //         steps
    //         {
    //             //echo "${env.JENKINS_URL}job/${env.JOB_NAME}/ws/trufflehog_output.json"
    //             echo "${env.JENKINS_URL}job/${env.JOB_NAME}/${env.BUILD_NUMBER}/execution/node/3/ws/trufflehog_output.json"

    //         }
    //     }

     
//    stage('trivy scan') {
//     steps {
//        def outputFilePath = "${env.WORKSPACE}"
//         bat 'docker pull aquasec/trivy'
//         bat 'docker build -t my-php-app .'
//         //bat "docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v ${WORKSPACE}:/root/.cache/ aquasec/trivy image --format json --output /root/.cache/trivy-report.json my-php-app"
//         bat 'docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v C:\Users\AsmaM\trrufellhog_project\PHP-MySQL-CRUD-Operation-Employee-Management-CRUD:/output aquasec/trivy:latest image --format template --template "@contrib/html.tpl" -o /output/report2.html my-php-app:latest'
//     }
// }

     stage('trivy scan') {
    steps {
        script {
            def outputFilePath = "${env.WORKSPACE}"
            bat 'docker pull aquasec/trivy'
            bat 'docker build -t my-php-app .'
            // Ensure the output directory exists
            
            bat "docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy:latest image -f table my-php-app:latest"
        }
    }
}


     // stage('trivy report'){
     //       steps{
     //            echo "${env.JENKINS_URL}job/${env.JOB_NAME}/${env.BUILD_NUMBER}/execution/node/3/ws/trivy-report.json"

            
     //       }
     // }
    }
     
    }

