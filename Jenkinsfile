node{
    
    def mavenHome= tool name: "Maven3.6.3"
    stage ('CheckOut the code from Git'){
        
        git credentialsId: 'GIT_CREDENTIALS', url: 'https://github.com/HarshithaKuppam/maven-web-application.git'
    }

     stage('Build Maven Package'){
       
            sh " ${mavenHome}/bin/mvn clean package"
    }
    
     stage('Execute SQ Report'){
        
        withSonarQubeEnv(credentialsId: 'jenkins sonarqube token',installationName: 'NewSonarQubeServer') {
    
          sh " ${mavenHome}/bin/mvn sonar:sonar"
        }

     }
     stage('Upload Artifact Into Jfrog'){
    
    
          sh " ${mavenHome}/bin/mvn deploy"
        
     }
    stage('Execute Ansible Playbook for Deployment of App In Tomcat Server'){
        
        ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible', inventory: 'dev.inv', playbook: 'apache.yml'
        }
    
}
