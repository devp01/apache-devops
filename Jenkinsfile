pipeline {
    agent any

  triggers {
    githubPush()
  }

    environment {
        IMAGE_NAME = "dp0211/apache-devops"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t apache-devops:${BUILD_NUMBER} .'
            }
        }

        stage('Tag Image') {
            steps {
                sh '''
                  docker tag apache-devops:${BUILD_NUMBER} ${IMAGE_NAME}:${BUILD_NUMBER}
                  docker tag apache-devops:${BUILD_NUMBER} ${IMAGE_NAME}:latest
                '''
            }
        }

        stage('Push Image') {

        steps {
            withDockerRegistry(
            credentialsId: 'dockerhub-creds',
            url: 'https://index.docker.io/v1/'
        ) {
            sh '''
              docker push ${IMAGE_NAME}:${BUILD_NUMBER}
              docker push ${IMAGE_NAME}:latest
            '''
        }
    }
}        


        stage('Deploy') {
            steps {
                sh '''
                  docker rm -f apache || true
                  docker run -d --name apache -p 8081:80 ${IMAGE_NAME}:${BUILD_NUMBER}
                '''
            }
        }
    }
}

