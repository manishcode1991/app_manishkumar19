pipeline {
  agent any
  environment {
    branch = "${env.BRANCH_NAME}"
    scannerHome = tool 'SonarQubeScanner';
  }
  tools {
    nodejs "nodejs"
    dockerTool 'docker'
  }
  stages {
    stage('Build') {
      steps {
        sh 'npm --prefix src i'
      }
    }
    stage('Unit Testing') {
      when {
        branch 'master'
      }
      steps {
        sh 'npm --prefix src test'
      }
    }
    stage('SonarQube Analysis') {
      when {
        branch 'develop'
      }
      steps {
        withSonarQubeEnv('Test_Sonar') {
          sh "${scannerHome}/bin/sonar-scanner"
        }
      }
    }
    stage('k8 Deployment') {
      steps {
        script {
          // I am replacing Image name and One value of ENV variable in jenkins workspace file and it will execute only for develop branch
          // for that I am using sed command
          if (env.BRANCH_NAME == "develop") {
            sh 'sed  -i -e s/PRODUCTION/DEV/g -e s/master/$branch/g  k8/first_deployment.yaml'
          }
        }
        sh 'kubectl apply -f k8/first_deployment.yaml'
      }
    }
  }
}