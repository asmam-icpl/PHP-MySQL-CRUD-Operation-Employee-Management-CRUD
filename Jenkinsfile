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

pipeline {
    agent any

    environment {
        // Replace with your Git repository URL
        REPO_URL = 'https://github.com/asmam-icpl/PHP-MySQL-CRUD-Operation-Employee-Management-CRUD.git'
        // Define the branch to scan
        BRANCH = 'sub'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository
                git branch: "${BRANCH}", url: "${REPO_URL}"
            }
        }

        stage('Install Gitleaks') {
            steps {
                script {
                    // Download gitleaks for Windows
                    bat 'powershell -command "Invoke-WebRequest -Uri (Invoke-RestMethod -Uri https://api.github.com/repos/zricethezav/gitleaks/releases/latest).assets | Where-Object { $_.name -like \\"*windows-amd64.zip\\" } | ForEach-Object { Invoke-WebRequest -Uri $_.browser_download_url -OutFile gitleaks.zip }"'
                    // Extract gitleaks
                    bat 'powershell -command "Expand-Archive -Path gitleaks.zip -DestinationPath ."'
                    // Move gitleaks to a directory in the PATH (e.g., C:\\tools\\gitleaks)
                    bat 'powershell -command "Move-Item -Path .\\gitleaks.exe -Destination C:\\tools\\gitleaks.exe"'
                }
            }
        }

        stage('Scan Repository') {
            steps {
                script {
                    try {
                        // Run gitleaks scan
                        bat 'C:\\tools\\gitleaks.exe detect --source . --report-format=json --report-path=gitleaks_report.json'
                    } catch (Exception e) {
                        // Handle the exception by marking the build as unstable
                        currentBuild.result = 'UNSTABLE'
                    }
                }
            }
        }

        stage('Publish Report') {
            steps {
                // Read and display the gitleaks report
                script {
                    def report = readFile 'gitleaks_report.json'
                    echo report
                }
            }
        }
    }
}
