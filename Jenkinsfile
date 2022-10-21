pipeline {
	agent any 
	stages {
		stage("Building student survey application image") {
			steps {
				script {
					checkout scm
					sh 'rm -rf *.war'
					sh 'jar -cvf StudentSurvey.war -C src/main/webapp .'
					sh 'echo ${BUILD_TIMESTAMP}'
					sh "docker login -u swe645nikita -p swe645123" 
					def customImage = docker.build("swe645nikita/studentsurvey645:${BUILD_TIMESTAMP}")
				}
			}
		}
		stage("Pushing Image to DockerHub") {
			steps {
				script {
					sh 'docker push swe645nikita/studentsurvey645:${BUILD_TIMESTAMP}'
				}
			}
		}
		stage("Deploying to Rancher") {
			steps {
				script {
					sh 'kubectl set image deployment/studentsurvey container-0=swe645nikita/studentsurvey645:${BUILD_TIMESTAMP} -n studentsurvey645'
				}
			}
		}
	}
}
