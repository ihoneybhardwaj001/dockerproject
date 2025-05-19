pipeline {
    agent any
    environment {
        HOME = "/home/ubuntu"
        PATH = "/usr/local/bin:/usr/bin:/bin:${env.PATH}"
    }
    stages {
        stage('Run deploy.sh') {
            steps {
                sh '/home/ubuntu/dockerproject/deploy.sh'
            }
        }
    }
}
