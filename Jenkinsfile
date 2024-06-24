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
node {
    stage('SCM') {
        checkout scm
    }
    stage('SonarQube Analysis') {
        def scannerHome = tool 'SonarScanner';
        withSonarQubeEnv() {
            bat "${scannerHome}/bin/sonar-scanner"
        }
    }
    stage('GitLeaks Scan') {
        // GitLeaks scanning step
        bat 'docker run --rm -v %WORKSPACE%\\PHP-MySQL-CRUD-Operation-Employee-Management-CRUD:/repo -v %WORKSPACE%\\PHP-MySQL-CRUD-Operation-Employee-Management-CRUD\\gitleaks.toml:/gitleaks.toml zricethezav/gitleaks detect --source="/repo" --config="/gitleaks.toml" --report-path="/repo/gitleaks_report.json" --report-format="json"'
    }
    stage('Display GitLeaks Report') {
        // Display the contents of the GitLeaks report in the console
        def reportFile = readFile 'PHP-MySQL-CRUD-Operation-Employee-Management-CRUD/gitleaks_report.json'
        echo "GitLeaks Report:\n${reportFile}"
    }
    stage('Debug Workspace') {
    steps {
        script {
            echo "Workspace path: ${WORKSPACE}"
        }
    }
}
}
