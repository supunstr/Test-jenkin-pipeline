pipeline {
    agent any
    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('test') {
            steps {
                withAWS(credentials: 'AWSCredentails-test', region: 'us-west-2') {
                    aws s3 ls
                }
            }
        }
    }
}
