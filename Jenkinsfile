pipeline {
  agent any

  environment {
    docker_user_name="manishsurbo"
    nagp_user_name="manishkumar19"
    build_id="${env.BUILD_ID}"
    branch="${env.BRANCH_NAME}"
    full_path_of_image="manishsurbo/i-manishkumar19-develop:19"
    registryUrl='https://registry.hub.docker.com'
    registryCredentialsId='dockerhub_account_detail'
  }
  tools {
    nodejs "nodejs"
    dockerTool 'docker'
  }
//   stages {
//     stage('Build and Push Docker Images1'){
//         steps{
//             script {
// //                 sh "docker build -t ${full_path_of_image} --no-cache ."
//                 dockerTool.withRegistry("https://registry.hub.docker.com", registryCredentialsId) {
//                     sh "docker push manishsurbo/i-manishkumar19-develop:19"
//                 }
//             }
//         }
//     }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub_account_detail', passwordVariable: '123456789', usernameVariable: 'manishsurbo')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push manishsurbo/i-manishkumar19-develop:19'
        }
      }
    }
//     stage('Docker Image Creation, Tagging & Push') {
//       steps {
//         script {
//             withDockerRegistry([credentialsId: 'dockerhub_account_detail']) {
//                 sh "docker push manishsurbo/i-manishkumar19-develop:19"
//             }
//         }
//         script {
//           withDockerRegistry(credentialsId: 'dockerhub_account_detail',url: 'https://registry.hub.docker.com') {
//             sh "docker push manishsurbo/i-manishkumar19-develop:19"
//           }
//         }
//         withDockerRegistry(credentialsId: 'dockerhub_account_detail', url: 'https://registry.hub.docker.com') {
//             sh "docker push manishsurbo/i-manishkumar19-develop:19"
//         }
//       }
//     }
  }
}