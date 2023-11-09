pipeline {
    agent any
    stages {
        stage('Pipeline Stage 1'){
            steps {
                sh "chmod 777 *.sh"
                sh "./stage1.sh"
            }
        }
        stage('Pipeline Stage 2'){
            steps {
                sh "./stage2.sh"
            }
        }
        stage('Pipeline Stage 3'){
            steps {
                sh "./stage3.sh"
            }
        }
    }
}
