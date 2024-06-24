pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/asmam-icpl/PHP-MySQL-CRUD-Operation-Employee-Management-CRUD.git', branch: 'sub'
            }
        }

        stage('Scan Repository') {
            steps {
                script {
                    try {
                        // Run Gitleaks scan using Docker
                        bat """
                        docker run --rm -v C:\\Users\\AsmaM\\code_infopercep\\git-leaks\\PHP-MySQL-CRUD-Operation-Employee-Management-CRUD:/repo -v C:\\Users\\AsmaM\\code_infopercep\\git-leaks\\PHP-MySQL-CRUD-Operation-Employee-Management-CRUD\\gitleaks.toml:/gitleaks.toml zricethezav/gitleaks detect --source=/repo --config=/gitleaks.toml > gitleaks_report.json
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
                        def report = readFile 'gitleaks_report.json'
                        echo "Gitleaks Report: ${report}"
                        
                        // Optionally, you can parse the JSON if needed
                        // Process the JSON content as required
                        
                        // For example, you can check for specific issues or publish the report
                        // You can use regular expressions or other methods to extract information from the report
                        // Example:
                        if (report.contains('password')) {
                            echo "Password found in Gitleaks report!"
                        }
                        
                        // Archive the JSON report for further analysis or download
                        archiveArtifacts artifacts: 'gitleaks_report.json', allowEmptyArchive: true
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
