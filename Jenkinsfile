pipeline {
	agent any 
	stages {
		stage("Building student survey application image") {
			steps {
				script {
					checkout scm
					sh 'rm -rf *.war'
					sh 'jar -cvf StudentSurvey.war -C src/ .'
					sh 'echo ${BUILD_TIMESTAMP}'
					sh "docker login -u swe645nikita -p swe645123" 
					def customImage = docker.build('swe645nikita/studentsurvey645:0.4')
				}
			}
		}
		stage("Pushing Image to DockerHub") {
			steps {
				script {
					sh 'docker push swe645nikita/studentsurvey645:0.4'
				}
			}
		}
		stage("Deploying to Rancher as a Single pod") {
			steps {
				script {
					sh 'kubectl set image deployment/studentsurvey container-0=swe645nikita/studentsurvey645:0.4 -n studentsurvey645'
				}
			}
		}
	}
}
