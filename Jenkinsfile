pipeline {
    agent any

    stages {
        stage('Run deploy.sh') {
            steps {
                // Make sure deploy.sh is executable
                sh 'chmod +x /home/ubuntu/dockerproject/deploy.sh'

                // Run the deploy.sh script
                sh '/home/ubuntu/dockerproject/deploy.sh'
            }
        }
    }
}
