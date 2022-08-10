pipeline {
  agent any

  environment {
//     scannerHome = tool 'SonarQubeScanner';
    docker_user_name="manishsurbo"
    nagp_user_name="manishkumar19"
    build_id="${env.BUILD_ID}"
    branch="${env.BRANCH_NAME}"
//     full_path_of_image="${docker_user_name}/i-${nagp_user_name}-${branch}:${build_id}"
    full_path_of_image="manishsurbo/i-manishkumar19-develop:19"
  }
  tools {
    nodejs "nodejs"
    dockerTool 'docker'
  }
  stages {
    stage('Build') {
      steps {
//         sh 'npm --prefix src i'
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
//     stage('SonarQube Analysis') {
//       when {
//         branch 'develop'
//       }
//       steps {
//         withSonarQubeEnv('Test_Sonar') {
//           sh "${scannerHome}/bin/sonar-scanner"
//         }
//       }
//     }
//     stage('Building image NGINX') {
//       steps{
//         script {
//           dockerImage = docker.build + "${full_path_of_image} ."
//         }
//       }
//     }
    stage('Docker Image Creation, Tagging & Push') {
      steps {
//         sh "docker build -t ${full_path_of_image} --no-cache ."
//         sh "docker tag ${full_path_of_image} ${full_path_of_image}"
//         sh "docker login --password=123456789 --username=${docker_user_name} https://registry.hub.docker.com"
//         sh "docker push ${full_path_of_image}"
      script {
      withDockerRegistry([credentialsId: 'dockerhub_account_detail', url: "https://registry.hub.docker.com"]) {
        sh "docker push manishsurbo/i-manishkumar19-develop:19"
  }
  }
  script {
          withDockerRegistry(credentialsId: 'dockerhub_account_detail') {
            sh "docker push manishsurbo/i-manishkumar19-develop:19"
//             sh "docker push manishsurbo/i-manishkumar19-develop:19"
          }
        }
            withDockerRegistry(credentialsId: 'dockerhub_account_detail', url: 'https://registry.hub.docker.com') {
//             echo "Hi i am inside"
// //             sh "docker login --password=123456789 --username=${docker_user_name} https://registry.hub.docker.com"
                    sh "docker push manishsurbo/i-manishkumar19-develop:19"
//                 dockerImage.push()
            }


    }
    stage('k8 Deployment') {
      steps {
        sh 'kubectl apply -f k8/first_deployment.yaml'
      }
    }
  }
}