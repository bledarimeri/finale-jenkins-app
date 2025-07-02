pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        DOCKER_IMAGE = "soloxbyte/finale-jenkins-app"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/bledarimeri/finale-jenkins-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $DOCKER_IMAGE ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        sh "docker push $DOCKER_IMAGE"
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh '''
                    kubectl set image deployment/finale-jenkins-app finale-jenkins-app=$DOCKER_IMAGE --record
                    '''
                }
            }
        }
    }

    triggers {
        githubPush()
    }
}
