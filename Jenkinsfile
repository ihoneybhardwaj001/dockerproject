pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin:/usr/bin:/bin:${env.PATH}"
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
        
        stage('Setup Node 22 with nvm') {
            steps {
                echo 'Installing and using Node 22 with nvm...'
                sh '''
                export NVM_DIR="$HOME/.nvm"
                # Install nvm if not installed
                if [ ! -d "$NVM_DIR" ]; then
                  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
                fi
                # Load nvm
                [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
                nvm install 22
                nvm use 22
                node -v
                npm -v
                # Install pm2 globally if not installed
                if ! command -v pm2 &> /dev/null; then
                  npm install -g pm2
                fi
                pm2 -v
                '''
            }
        }

        stage('Check Node, npm, and pm2 versions') {
            steps {
                echo 'Checking Node, npm, and pm2 versions:'
                sh '''
                node -v
                npm -v
                pm2 -v
                '''
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
