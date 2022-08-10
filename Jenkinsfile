pipeline {
  agent any

  environment {
    docker_user_name="manishsurbo"
    nagp_user_name="manishkumar19"
    build_id="${env.BUILD_ID}"
    branch="${env.BRANCH_NAME}"
    full_path_of_image="manishsurbo/i-manishkumar19-develop:19"
  }
  tools {
    nodejs "nodejs"
    dockerTool 'docker'
  }
  stages {
    stage('Docker Image Creation, Tagging & Push') {
      steps {
        script {
            withDockerRegistry([credentialsId: 'dockerhub_account_detail', url: "https://registry.hub.docker.com"]) {
                sh "docker push manishsurbo/i-manishkumar19-develop:19"
            }
        }
        script {
          withDockerRegistry(credentialsId: 'dockerhub_account_detail') {
            sh "docker push manishsurbo/i-manishkumar19-develop:19"
          }
        }
        withDockerRegistry(credentialsId: 'dockerhub_account_detail', url: 'https://registry.hub.docker.com') {
                sh "docker push manishsurbo/i-manishkumar19-develop:19"
        }
  }
}