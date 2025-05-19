pipeline {
    agent any

    stages {
        stage('Run deploy.sh') {
            steps {
                echo 'Executing deploy.sh script...'
                sh '/home/ubuntu/dockerproject/deploy.sh'
            }
        }
    }
}
