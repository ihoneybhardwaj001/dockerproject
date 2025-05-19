pipeline {
    agent any

    environment {
        HOME = "/var/lib/jenkins"
    }

    stages {
        stage('Run deploy.sh') {
            steps {
                sh '/home/ubuntu/dockerproject/deploy.sh'
            }
        }
    }
}
