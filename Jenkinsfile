pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your code repository
                git url: 'https://github.com/asmam-icpl/PHP-MySQL-CRUD-Operation-Employee-Management-CRUD.git', branch: 'sub'
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

        // Add more stages here if needed

    }
}
