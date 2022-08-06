pipeline {
  agent any

  environment {
//     scannerHome = tool 'SonarQubeScanner';
//     dockerPort="${env.BRANCH_NAME == "develop" ? 7300 : 7200}"
//     dockerRegistryUsername="manishsurbo"
//     username="manishkumar19"
    branch="develop"
//     full_path_of_image=${dockerRegistryUsername}/i-${username}-${env.BRANCH_NAME}

  }
  tools {
    nodejs "nodejs"
    dockerTool 'nagp_docker'
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
        sh 'npm test'
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
   
  }
}