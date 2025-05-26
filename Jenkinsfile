pipeline{
    agent any;
    
    stages{
        stage("Project Cloning"){
            steps{
                echo "Project Cloning is in Progress!!"
                git url:"https://github.com/dharmeshludhani/two-tier-flask-app.git", branch:"master"
            }
        }
        stage("Image Building"){
            steps{
                echo "Conatiner Image is in Building Process!!"
                sh "docker build -t 2-tier-app-latest ."
            }
        }
        stage("Pushing image to Docker hub"){
            steps{
                echo "Image Pushing to Docker Hub!!"
                withCredentials([usernamePassword(
                    credentialsId:"dockerHubCreds",
                    passwordVariable:"dockerHubPass",
                    usernameVariable:"dockerHubUser"
                    )]){
                
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker image tag 2-tier-app:latest ${env.dockerHubUser}/2-tier-app:latest"
                sh "docker push ${env.dockerHubUser}/2-tier-app:latest"
            }
        }
        }
        stage("Container's Creation"){
            steps{
                echo "Container is Creating from the image available at Docker Hub"
                sh "docker compose up -d"
            }
        }
        
        
    }
    
}
