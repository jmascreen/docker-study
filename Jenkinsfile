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
    stage('Scan DockerFile') {
      agent any
      steps {
        script {
          def trivyScan = sh(script: 'trivy -q -f json -o /home/doja-01/trivy-reports/trivy-docker-file-scan.json config Dockerfile', returnStdout: true).trim()
          writeFile file: 'trivyScan.md', text: trivyScan
        }
      }
    }
    stage('Security Scan') {
      agent any
      steps {
        script {
          def trivyScan = sh(script: 'trivy -q -f json -o /home/doja-01/trivy-reports/trivy-docker-image-scan.json image my-php-site:latest', returnStdout: true).trim()
          writeFile file: 'trivyScan.md', text: trivyScan
        }
        
      }
    }
  }
}

