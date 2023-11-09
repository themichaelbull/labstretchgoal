pipeline {
    agent any
    stages {
        stage('Cleanup Stage'){
            steps {
                sh "rm -rf *"
                sh "docker rm -f \$(docker ps -aq) || true"
                sh "docker rmi -f \$(docker images) || true"
                sh "docker rm -f \$(docker ps -aq) || true"
                sh "docker rmi -f \$(docker images) || true"
                sh "docker network rm my-network || true"
            }
        }
        stage('Clone Repo'){
            steps {
                sh "git clone https://github.com/themichaelbull/labstretchgoal"
                sh "cp -r labstretchgoal/* ./"
            }
        }
        stage('Docker Build and Network'){
            steps {
                sh "docker network create my-network"
                sh "docker build -t myapp . -f Dockerfile --no-cache"
                sh "docker build -t nginxcustom . -f DockerfileNginx --no-cache"
            }
        }
        stage('Docker Run'){
            steps {
                sh "docker run -d --name myapp --network my-network myapp myapp"
                sh "docker run -d -p 80:80 --name nginxcustom --network my-network nginxcustom:latest"
            }
        }
    }
}
