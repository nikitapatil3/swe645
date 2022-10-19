pipeline {
	agent any 
	environment {
		DOCKERHUB_PASS = credentials('swe645123')
	}
	stages {
		stage("Building student survey application image") {
			steps {
				script {
					checkout scm
					sh 'rm -rf *.war'
					sh 'jar -cvf StudentSurvey.war -C WebContent/ .'
					sh 'echo ${BUILD_TIMESTAMP}'
					sh "docker login -u swe645nikita -p {DOCKERHUB_PASS}" 
					def customImage = docker.build("swe645nikita/studentsurvey645:${BUILD_TIMESTAMP}")
				}
			}
	}
}
}
