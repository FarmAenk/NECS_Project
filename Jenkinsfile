pipeline {
    agent any
    stages {
        stage('Declarative: Checkout SCM') {
            steps { checkout scm }
        }
        stage('Build Docker Image') {
            steps {
                sh "docker build --build-arg CACHEBUSTER=\$(date +%s) -t chat-app-pipeline-web:latest ."
            }
        }
        stage('Deploy Locally') {
            steps {
                sh 'docker compose stop'
                sh 'docker compose rm -f'
                sh 'docker compose up -d'
            }
        }
        stage('Clean Up') {
            steps {
                echo "Cleaning up old Docker images..."
                sh 'docker image prune -f'
                sh 'docker rmi $(docker images --filter "dangling=true" -q --no-trunc) || true'
            }
        }
    }
}
