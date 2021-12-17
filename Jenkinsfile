pipeline {
    agent any
    stages {
        stage('Build Dockerfile') {
            steps{
                sh 'docker build -t node-test .'
            }
        }
        stage('Test mocha (unit test)') {
            agent {
                docker {
                    image 'node-test'
                }
            }
            steps {
                sh 'npm test'
            }
        }
        stage('Deploy to docker') {
            steps {
                sh 'docker stop helloworld || true; docker rm -f helloword || true'
                sh 'docker run -d --restart unless-stopped -p 8000:3000 --name helloworld node-test'
            }
        }
    }
}
