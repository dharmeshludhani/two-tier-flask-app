pipeline{
    agent {label "dev"};
    
    stages{
        stage("Clean Worksapce"){
            steps{
                cleanWs()
            }
        }
        stage("Clone Repository"){
            steps{
                   git url:"https://github.com/dharmeshludhani/two-tier-flask-app.git/", branch: "Flask-Deployment"
            }
        }
        stage("Build Image"){
            steps{
                sh "docker build -t dharmeshludhani/flask-app:latest ."
            }
        }
        stage("Push to Docker Hub"){
            steps{
                echo "Pushing Stage"
            }
        }
        stage("Deployment Phase"){
            steps{
                sh "docker compose down"
                sh "docker compose up -d --build"
            }
        }
    }
}