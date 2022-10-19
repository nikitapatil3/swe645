pipeline {
	agent any 
	stages {
		stage('Initialize') {
     			   def dockerHome = tool 'myDocker'
        			env.PATH = "${dockerHome}/bin:${env.PATH}"
   		 }
		stage("Building student survey application image") {
			steps {
				script {
					checkout scm
					sh 'rm -rf *.war'
					sh 'jar -cvf StudentSurvey.war -C src/ .'
					sh 'echo ${BUILD_TIMESTAMP}'
					sh "docker login -u swe645nikita -p swe645123" 
					def customImage = docker.build("swe645nikita/studentsurvey645:${BUILD_TIMESTAMP}")
				}
			}
		}
	}
}
