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
        withAWS(credentials: 'sam-jenkins-demo-credentials', region: 'us-west-2') {
          sh 'aws s3 ls'
        }
      }
    }

        // Additional stages for Terraform Plan, Apply, etc.
    }

    post {
        success {
            // Add post-build actions or notifications on success
        }
        failure {
            // Add post-build actions or notifications on failure
        }
    }
}
