pipeline {
    agent any
    stages {
        stage('Build Dockerfile') {
            sh 'docker build -t node-test .'
        }
        stage('Test mocha (unit test)') {
            agent {
                docker {
                    image 'node-test'
                }
            }
            steps {
                sh 'npm i'
                sh 'npm test'
            }
        }
        stage('Deploy to docker') {
            steps {
                sh 'docker stop helloworld; docker rm -f helloword;true'
                sh 'docker run -d --restart unless-stopped --name helloworld node-test'
            }
        }
    }
}
