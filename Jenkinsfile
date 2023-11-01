pipeline {
    agent any
    environment {
    AWS_ACCESS_KEY_ID = credentials('AWSCredentails-test')
    AWS_SECRET_ACCESS_KEY = credentials('AWSCredentails-test')
    AWS_REGION = 'us-east-1'
}
    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('test') {
            steps {
             //   withAWS(region: env.AWS_REGION, credentials: 'AWSCredentails-test') {
                    sh 'aws s3 ls'
              //  }
            }
        }
    }
}
