pipeline {
    agent any
    
    stages {
        //stage ('s3 - create bucket') {
          //  steps {
               // sh ('ansible-playbook s3-bucket.yml')
             //}
       //}
        stage('Checkout') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'git@github.com:ponnamnagesh/TerraformJenkinsS3Ansible.git']]])            

          }
        }    
        stage ("Terraform Init") {
            steps {
                sh ('terraform init') 
            }
        }
        stage ("Terraform Plan") {
            steps {
                sh ('terraform plan') 
            }
        }
        stage ("Terraform Action") {
            steps {
                echo "Terraform action is --> ${action}"
                sh ('terraform ${action} --auto-approve') 
                //sh ('terraform apply --auto-approve') 
                //sh ('terraform destroy --auto-approve')
           }
        }
    }
}


