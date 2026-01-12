pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps { git 'https://github.com/devp01/apache-devops.git' }
    }
    stage('Build Image') {
      steps { sh 'docker build -t apache-devops:${BUILD_NUMBER} .' }
    }
    stage('Push Image') {
      steps {
        sh 'docker tag apache-devops:${BUILD_NUMBER} dp0211/apache-devops:${BUILD_NUMBER}'
        sh 'docker push dp0211/apache-devops:${BUILD_NUMBER}'
      }
    }
    stage('Deploy') {
      steps {
        sh 'docker rm -f apache || true'
        sh 'docker run -d --name apache -p 8081:80 dp0211/apache-devops:${BUILD_NUMBER}'
      }
    }
  }
}

