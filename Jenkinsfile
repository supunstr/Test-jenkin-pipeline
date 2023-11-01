pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
              steps {
      //  withAWS(credentials: 'AWSCredentails-test', region: 'us-west-2') {
      //    sh 'aws s3 ls'
           echo 'Hello World'
        }
      }
    }

        // Additional stages for Terraform Plan, Apply, etc.
    }
}
