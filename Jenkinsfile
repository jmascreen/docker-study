#!groovy

pipeline {
  agent none
  stages {
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t my-php-site:latest .'
      }
    }
    stage('Security Scan') {
      steps {
        script {
          def trivyScan = sh(script: 'trivy -q -f json -o /var/lib/jenkins/reports/trivy-report.json your-image:tag', returnStdout: true).trim()
          writeFile file: 'trivyScan.md', text: trivyScan
        }
      }
    }
  }
}

