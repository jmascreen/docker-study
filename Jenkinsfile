#!groovy

pipeline {
  agent none
  stages {
    stage('Blank Stage') {

    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t my-php-site:latest .'
      }
    }
  }
}

