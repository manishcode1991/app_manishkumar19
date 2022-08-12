pipeline {
  agent any

  environment {
    docker_user_name="manishsurbo"
    nagp_user_name="manishkumar19"
    build_id="${env.BUILD_ID}"
    branch="${env.BRANCH_NAME}"
    full_path_of_image="manishsurbo/i-manishkumar19-develop:19"
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
//       when {
//         branch 'master'
//       }
      steps {
        sh 'npm --prefix src test'
      }
    }
//     stage('SonarQube Analysis') {
//       when {
//         branch 'develop'
//       }
//       steps {
//         withSonarQubeEnv('Test_Sonar') {
//           sh "echo ${scannerHome}"
//           echo scannerHome
//           sh "${scannerHome}/bin/sonar-scanner"
//         }
//       }
//     }
    stage('Docker Image Creation, Tagging & Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub_account_detail', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh "docker build -t ${full_path_of_image} --no-cache ."
          sh "docker tag ${full_path_of_image} ${full_path_of_image}"
          sh 'docker push ${full_path_of_image}'
        }
      }
    }
    stage('k8 Deployment') {
      steps {
        sh '/var/jenkins_home/gcloud_login/google-cloud-sdk/bin/kubectl apply -f k8/first_deployment.yaml'
      }
    }
  }
}