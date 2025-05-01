pipeline {
    agent { label 'server1-jun' }

    stages {
        stage('Pull SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/junedirajagukguk/simple-apps.git'
            }
        }
        
        stage('Build') {
            steps {
                sh'''
                cd app
                npm install
                '''
            }
        }
        
        stage('Testing') {
            steps {
                sh'''
                cd app
                APP_PORT=3002 npm test
                APP_PORT=3002 npm run test:coverage
                '''
            }
        }
        
        stage('Code Review') {
            steps {
                sh'''
               cd app
sonar-scanner   -Dsonar.projectKey=simple-apps   -Dsonar.sources=.   -Dsonar.host.url=http://172.23.9.14:9000   -Dsonar.login=sqp_d075e8eab09f9dd38c31cd3119914a5091100508
                '''
            }
        }
        
        stage('Deploy') {
            steps {
                sh'''
                docker compose up --build -d
                '''
            }
        }
        
        stage('Backup') {
            steps {
                 sh 'docker compose push' 
            }
        }
    }
}