pipeline {
    agent any

    environment {
        IMAGE_NAME = "devops-portfolio-demo"
        IMAGE_TAG  = "${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Run Basic Health Check') {
            steps {
                sh '''
                    docker run -d --name test_container -p 8081:80 $IMAGE_NAME:$IMAGE_TAG
                    sleep 5
                    curl -f http://localhost:8081 || exit 1
                    docker rm -f test_container
                '''
            }
        }

        stage('Approval') {
            steps {
                input message: "Deploy build #${IMAGE_TAG} to production?"
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    docker rm -f devops_portfolio_prod || true
                    docker run -d --name devops_portfolio_prod -p 80:80 $IMAGE_NAME:$IMAGE_TAG
                '''
            }
        }
    }

    post {
        success {
            echo "Deployment successful: build #${IMAGE_TAG}"
        }
        failure {
            echo "Pipeline failed - check logs above"
        }
    }
}
