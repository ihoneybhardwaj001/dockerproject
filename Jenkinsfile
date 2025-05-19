pipeline {
    agent any

    environment {
        // Add any environment variables your script might need here
        PATH = "/usr/local/bin:/usr/bin:/bin:${env.PATH}"
        // Example: MY_VAR = "value"
    }

    stages {
        stage('Prepare and Debug Info') {
            steps {
                echo 'Running on user:'
                sh 'whoami'
                
                echo 'Current directory:'
                sh 'pwd'
                
                echo 'Listing deploy.sh details:'
                sh 'ls -l /home/ubuntu/dockerproject/deploy.sh'
            }
        }
        stage('Run deploy.sh') {
            steps {
                echo 'Executing deploy.sh script...'
                sh '/home/ubuntu/dockerproject/deploy.sh'
            }
        }
    }
}
