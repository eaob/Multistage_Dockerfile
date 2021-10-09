pipeline {
  environment {
    registry = "eaob/nodejs-app"
    registryCredential = "dockerhub"
    dockerImage  =  ""
  }
  agent { label 'docker' }
  parameters {
        choice(name: 'nodeversion', choices: ['16.10', '14.18', '12.22'], description: 'Specify nodejs version')
    }
  //stages {
  //  stage('Cloning Git') {
   //   steps {
   //     git branch: 'main', credentialsId: 'github', url: 'git@github.com:eaob/Multistage_Dockerfile.git'
   //   }
   // }
    stage('Build & Push Image') {
      steps{
        script {
          withCredentials ([usernamePassword (credentialsId: registryCredential, usernameVariable: 'USERNAME' , passwordVariable: 'PASSWORD' )]) {
          withDockerRegistry(credentialsId: registryCredential, url: 'https://docker.io') {
          sh "docker login -u ${USERNAME} -p ${PASSWORD}"
          def dockerImage = docker.build("${env.registry}:1.${env.BUILD_ID}", "--build-arg NODEVERSION=${params.nodeversion} .")
          dockerImage.push()
          dockerImage.push("latest")
            }
          }
        }
      }
    }  
    stage('Clean local images & workdir') {
      steps{
        sh "docker rmi ${env.registry}:1.${env.BUILD_ID}"
        deleteDir ()
      }
    }
  }
}
