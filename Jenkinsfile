pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWSCredentails-test')
        AWS_SECRET_ACCESS_KEY = credentials('AWSCredentails-test')
        AWS_REGION = 'us-east-1'
    }

    parameters {
        choice(name: 'applyOrDestroyChoice', choices: 'Apply\nDestroy', description: 'Select Apply or Destroy')
    }

    stages {
        stage('Plan') {
            steps {
                script {
                    currentBuild.displayName = params.version
                }
                sh 'terraform init -input=false'
                sh "terraform plan -input=false -out tfplan"
                sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }

        stage('Approval') {
            when {
                not {
                    expression {
                        params.autoApprove || params.applyOrDestroy
                    }
                }
            }

            steps {
                script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Review the plan and confirm:",
                        parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                }
            }
        }

        stage('Apply/Destroy') {
            when {
                expression {
                    params.autoApprove || params.applyOrDestroy
                }
            }

            steps {
                script {
                    def command = "terraform ${params.applyOrDestroyChoice ? 'apply' : 'destroy'} -input=false tfplan"
                    sh command
                }
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'tfplan.txt'
        }
    }
}
