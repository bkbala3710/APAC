pipeline {
  agent any
 
  environment {
    ENV = "${env.BRANCH_NAME}"
    TF_WORKDIR = "environments/${env.BRANCH_NAME}"
  }

  stages {

    stage('Checkout') {
      steps {
        git(
          branch: "${env.BRANCH_NAME}",
          url: 'https://github.com/bkbala3710/APAC.git',
          credentialsId: 'bc751208-b51c-46fe-9124-572af2259811'
        )

        script {
          if (!env.GIT_TAG_NAME) {
            echo "🔕 Not a tag. Build will stop."
            currentBuild.result = 'NOT_BUILT'
            error("This pipeline runs only on tags")
          }
          echo "✔ Tag detected: ${env.GIT_TAG_NAME}"
        }
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
