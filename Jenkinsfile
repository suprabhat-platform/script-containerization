pipeline {

  agent any

  stages {

stage('Checkout Source') {
    steps {
        println("Starting application checkout")
        git branch: 'main', url: 'https://github.com/suprabhat-platform/script-containerization.git'
        println("Application checkout successful")
    }
}
	  
    stage('Build image and Publish to DockerHub') {
    environment {
    DOCKER_IMAGE = "suprabhatcs/script-containerization:${BUILD_NUMBER}"
    registryCredential = 'dockerhub-credentials'
     }
      steps{
        script {
	 println("Docker image build started")
	 println(DOCKER_IMAGE)
	 bat 'docker build -t %DOCKER_IMAGE% .'
	 println("Docker build successful")
	 println("Image push to DockerHub started")	
	 def dockerImage = docker.image(DOCKER_IMAGE)
         docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) 
	 {
            dockerImage.push()
	    println("Image push to DockerHub successfull")
          }
        }
      }
    }
  
  }
}