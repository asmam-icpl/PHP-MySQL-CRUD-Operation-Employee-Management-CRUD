node {
  stage('SCM') {
    checkout scm
  }
  stage('SonarQube Analysis') {
    def scannerHome = tool 'SonarScanner';
    withSonarQubeEnv() {
      sh "${scannerHome}/bin/sonar-scanner"
    }
  }
}

// pipeline {
//     agent any

//     stages {
//          stage('Checkout') {
//              steps {
//                  git branch: 'main', url:' https://github.com/trufflesecurity/trufflehog.git'
//              }
//          }


        
//         stage('SonarQube Analysis') {
//             steps {
//                 script {
//                     def scannerHome = tool name: 'SonarScanner'
//                     withSonarQubeEnv('SonarQubeServer') {
//                         bat "${scannerHome}/bin/sonar-scanner"
//                     }
//                 }
//             }
//         }
        
//         stage('Git Scanning') {
//             steps {
//                 script {
//                     def outputFilePath = "${env.WORKSPACE}/trufflehog_output.json"
                    
//                     // Pull the latest TruffleHog Docker image
//                     bat 'docker pull trufflesecurity/trufflehog'
                    
//                     // Run TruffleHog and save the output to a file in the workspace
//                     bat "docker run --rm trufflesecurity/trufflehog --json git https://github.com/asmam-icpl/PHP-MySQL-CRUD-Operation-Employee-Management-CRUD.git > ${outputFilePath}"
                    
//                     // Print the path of the output file
//                     echo "The TruffleHog output file is located at: ${outputFilePath}"
                    
//                     // Optionally, read the file content and print it (for debugging purposes)
//                     bat "type ${outputFilePath}"
//                 }
//             }
//         }
//     }
// }
