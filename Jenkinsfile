pipeline {
    agent any

    environment {
        FLASK_DIR = 'backend'
        EXPRESS_DIR = 'frontend'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/ihoneybhardwaj001/dockerproject.git'
            }
        }

        stage('Install Flask Dependencies') {
            steps {
                dir("${FLASK_DIR}") {
                    sh 'pip3 install -r requirements.txt'
                }
            }
        }

        stage('Install Express Dependencies') {
            steps {
                dir("${EXPRESS_DIR}") {
                    sh 'npm install'
                }
            }
        }

        stage('Run Flask App') {
            steps {
                sh '''
                pm2 delete flask-app || true
                pm2 start backend/app.py --name flask-app
                '''
            }
        }

        stage('Run Express App') {
            steps {
                sh '''
                pm2 delete express-app || true
                pm2 start frontend/index.js --name express-app
                '''
            }
        }
    }
}

