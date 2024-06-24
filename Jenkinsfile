// node {
//   stage('SCM') {
//     checkout scm
//   }
//   stage('SonarQube Analysis') {
//     def scannerHome = tool 'SonarScanner';
//     withSonarQubeEnv() {
//       bat "${scannerHome}/bin/sonar-scanner"
//     }
//   }
// }

//------------2-----------
// node {
//     stage('SCM') {
//         checkout scm
//     }
//     stage('SonarQube Analysis') {
//         def scannerHome = tool 'SonarScanner';
//         withSonarQubeEnv() {
//             bat "${scannerHome}/bin/sonar-scanner"
//         }
//     }
//     stage('GitLeaks Scan') {
//         // GitLeaks scanning step
//         bat 'docker run --rm -v %WORKSPACE%\\PHP-MySQL-CRUD-Operation-Employee-Management-CRUD:/repo -v %WORKSPACE%\\PHP-MySQL-CRUD-Operation-Employee-Management-CRUD\\gitleaks.toml:/gitleaks.toml zricethezav/gitleaks detect --source="/repo" --config="/gitleaks.toml" --report-path="/repo/gitleaks_report.json" --report-format="json"'
//     }
//     stage('Display GitLeaks Report') {
//         // Display the contents of the GitLeaks report in the console
//         def reportFile = readFile 'PHP-MySQL-CRUD-Operation-Employee-Management-CRUD/gitleaks_report.json'
//         echo "GitLeaks Report:\n${reportFile}"
//     }
//     stage('Debug Workspace') {
//     steps {
//         script {
//             echo "Workspace path: ${WORKSPACE}"
//         }
//     }
// }
// }


//-------------------------3----------

// pipeline {
//     agent any

//     environment {
//         // Replace with your Git repository URL
//         REPO_URL = 'https://github.com/asmam-icpl/PHP-MySQL-CRUD-Operation-Employee-Management-CRUD.git'
//         // Define the branch to scan
//         BRANCH = 'sub'
//     }

//     stages {
//         stage('Clone Repository') {
//             steps {
//                 // Clone the repository
//                 git branch: "${BRANCH}", url: "${REPO_URL}"
//             }
//         }

       

//        stage('Scan Repository') {
//         steps {
//             script {
//                 try {
//                     // Run gitleaks scan using Docker
//                     bat 'docker run --rm -v %cd%:/src zricethezav/gitleaks:latest detect --source /src --report-format=json --report-path=/src/gitleaks_report.json'
//                 } catch (Exception e) {
//                     // Handle the exception by marking the build as unstable
//                     currentBuild.result = 'UNSTABLE'
//                 }
//             }
//         }
//     }

//         stage('Publish Report') {
//             steps {
//                 // Read and display the gitleaks report
//                 script {
//                     def report = readFile 'gitleaks_report.json'
//                     echo report
//                 }
//             }
//         }
//     }
// }

//-----------5-----------
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your code repository
                git url: 'https://your-repository-url.git', branch: 'main'
            }
        }

        stage('Scan Repository') {
            steps {
                script {
                    try {
                        // Run gitleaks scan using Docker
                        bat """
                        docker run --rm -v C:\\Users\\AsmaM\\code_infopercep\\git-leaks\\PHP-MySQL-CRUD-Operation-Employee-Management-CRUD:/repo -v C:\\Users\\AsmaM\\code_infopercep\\git-leaks\\PHP-MySQL-CRUD-Operation-Employee-Management-CRUD\\gitleaks.toml:/gitleaks.toml zricethezav/gitleaks detect --source=/repo --config=/gitleaks.toml
                        """
                    } catch (Exception e) {
                        // Handle the exception by marking the build as unstable
                        currentBuild.result = 'UNSTABLE'
                    }
                }
            }
        }

        stage('Publish Report') {
            steps {
                script {
                    try {
                        // Read the JSON report
                        def report = readFile 'C:\\Users\\AsmaM\\code_infopercep\\git-leaks\\PHP-MySQL-CRUD-Operation-Employee-Management-CRUD\\gitleaks_report.json'
                        echo "Gitleaks Report: ${report}"
                        
                        // Optionally, you can parse the JSON if needed
                        def reportJson = readJSON text: report
                        // Process the JSON content as required
                        
                        // For example, you can check for specific issues or publish the report
                        if (reportJson) {
                            // Do something with the JSON report, e.g., save it to an artifact
                            archiveArtifacts artifacts: 'C:\\Users\\AsmaM\\code_infopercep\\git-leaks\\PHP-MySQL-CRUD-Operation-Employee-Management-CRUD\\gitleaks_report.json', allowEmptyArchive: true
                        }
                    } catch (Exception e) {
                        // Handle exceptions if reading the file fails
                        currentBuild.result = 'UNSTABLE'
                        echo "Failed to read Gitleaks report: ${e}"
                    }
                }
            }
        }

        stage('Build') {
            steps {
                // Your build steps here
            }
        }

        stage('Test') {
            steps {
                // Your test steps here
            }
        }
    }
}
