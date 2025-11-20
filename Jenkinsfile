pipeline {
  agent any

  // Run pipeline only when a TAG is pushed


  environment {
    ENV = "${env.GIT_TAG_NAME}"
    TF_WORKDIR = "environments/${env.GIT_TAG_NAME}"
  }

  stages {

    stage('Checkout') {
      steps {
        git(
          branch: "${env.GIT_TAG_NAME}",
          url: 'https://github.com/bkbala3710/APAC.git',
          credentialsId: 'bc751208-b51c-46fe-9124-572af2259811'
        )
      }
    }

    stage('Terraform Init') {
      steps {
        dir("${TF_WORKDIR}") {
          sh 'terraform init -reconfigure'
        }
      }
    }

    stage('Terraform Plan') {
      steps {
        dir("${TF_WORKDIR}") {
          sh 'terraform plan -out=tfplan'
          sh 'terraform show -no-color tfplan > tfplan.txt'
          sh 'cat tfplan.txt'
        }
      }
    }

    stage('Approval') {
      steps {
        input message: "Approve the deployment to production?", ok: 'Deploy'
      }
    }

    stage('Terraform Apply') {
      steps {
        dir("${TF_WORKDIR}") {
          sh 'terraform apply tfplan'
        }
      }
    }
  }
}
