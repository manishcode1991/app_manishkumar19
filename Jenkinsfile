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
        echo "=====Build Stage Start Here===="
        sh 'npm --prefix src i'
        echo "=====Build Stage Ending Here ===="
      }
    }
    stage('Unit Testing') {
      when {
        branch 'master'
      }
      steps {
        echo "=====Unit Testing Stage Start Here===="
        sh 'npm --prefix src test'
        echo "=====Unit Testing Stage Ending Here===="
      }
    }
    stage('SonarQube Analysis') {
      when {
        branch 'develop'
      }
      steps {
        withSonarQubeEnv('Test_Sonar') {
          echo "=====SonarQube Analysis Stage Start Here===="
          sh "${scannerHome}/bin/sonar-scanner"
          echo "=====SonarQube Analysis Stage Ending Here===="
        }
      }
    }
    stage('k8 Deployment') {
      steps {
        echo "=====k8 Deployment Stage Start Here===="
        script {
          // I am replacing Image name and One value of ENV variable in jenkins workspace file and it will execute only for develop branch
          // for that I am using sed command
          if (env.BRANCH_NAME == "develop") {
            sh 'sed  -i -e s/PRODUCTION/DEV/g -e s/master/$branch/g  k8/first_deployment.yaml'
          }
          sh 'kubectl apply -f k8/first_deployment.yaml'
          echo "=====k8 Deployment Stage Ending Here===="
        }
      }
    }
  }
}