pipeline{
    agent any;
    
    stages{
        stage("Project Cloning"){
            steps{
                echo "Project Cloning is in Progress!!"
                git url:"https://github.com/dharmeshludhani/two-tier-flask-app.git", branch:"practice"
            }
        }
        stage("Image Building"){
            steps{
                echo "Conatiner Image is in Building Process!!"
                sh "docker build  --no-cache -t  two-tier-app-latest ."
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
                sh "docker image tag two-tier-app-latest:latest ${env.dockerHubUser}/two-tier-app-latest:latest"
                sh "docker push ${env.dockerHubUser}/two-tier-app-latest:latest"
            }
        }
        }
        stage("Container's Creation"){
            steps{
                echo "Container is Creating from the image available at Docker Hub"
                
                sh "docker-compose up -d "
            }
        }
        
        
    }
    
}
