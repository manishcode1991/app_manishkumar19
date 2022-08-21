pipeline {
  agent any

  environment {
    docker_user_name="manishsurbo"
    nagp_user_name="manishkumar19"
    build_id="${env.BUILD_ID}"
    branch="${env.BRANCH_NAME}"
    full_path_of_image="${docker_user_name}/i-${nagp_user_name}-${branch}:${build_id}"
    full_path_of_image_with_latest_tag="${docker_user_name}/i-${nagp_user_name}-${branch}:latest"
    scannerHome = tool 'SonarQubeScanner';
    build_publish_docker_image= 'true'
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
    //** By default this step get ignored but we can change env variable to 'true' if want to push latest image
    stage("Build and push docker image") {
        when {
            environment name: 'build_publish_docker_image', value: 'true'
        }
        steps {
           script {
            docker.withRegistry('https://index.docker.io/v1/', 'dockerhub_account_detail') {
                def dockerImage = docker.build(${full_path_of_image})
                dockerImage.push("latest")
            }
           }
        }
    }
//     stage('Docker Image Creation, Tagging & Push') {
//       agent any
//       steps {
//         withCredentials([usernamePassword(credentialsId: 'dockerhub_account_detail', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
//           sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
//           sh "docker build -t ${full_path_of_image} --no-cache ."
//           sh "docker tag ${full_path_of_image} ${full_path_of_image}"
//           sh "docker tag ${full_path_of_image} ${full_path_of_image_with_latest_tag}"
//           sh 'docker push ${full_path_of_image}'
//           sh 'docker push ${full_path_of_image_with_latest_tag}'
//         }
//       }
//     }
    stage('k8 Deployment') {
      steps {
        script {
    // 	    I am replacing Image name and One value of ENV variable in jenkins workspace file and it will execute only for develop branch
    // 	    for that I am using sed command
            if (env.BRANCH_NAME == "develop") {
               sh 'sed  -i -e s/PRODUCTION/DEV/g -e s/master/$branch/g  k8/first_deployment.yaml'
            }
          }
          sh 'kubectl apply -f k8/first_deployment.yaml'
      }
    }
  }
}
