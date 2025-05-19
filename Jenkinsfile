pipeline {
    agent any

    stages {
        stage('Run deploy.sh') {
            steps {
            

                // Run the deploy.sh script
                sh '/home/ubuntu/dockerproject/deploy.sh'
            }
        }
    }
}
