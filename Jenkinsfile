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
  stage('git scanning') {
    bat 'docker pull trufflesecurity/trufflehog'
    bat 'docker run trufflesecurity/trufflehog --json git https://github.com/trufflesecurity/trufflehog.git > trufflehog_output.json'
    
  }
}
