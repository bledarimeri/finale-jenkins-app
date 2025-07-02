pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('finaledocker')
        DOCKER_IMAGE = "soloxbyte/finale-jenkins-app"
    }

    stages {
        stage('Clone Repo') {
            steps {
                // Klonon branch-in 'main' nga GitHub
                git branch: 'main', url: 'https://github.com/bledarimeri/finale-jenkins-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Ndërton docker imazhin me tagun tënde
                bat "docker build -t $DOCKER_IMAGE ."
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Log in në Docker Hub dhe push imazhin
                    docker.withRegistry('https://index.docker.io/v1/', 'finaledocker') {
                        bat "docker push $DOCKER_IMAGE"
                    }
                }
            }
        }
    }
}
