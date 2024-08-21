Instead of sh use bat for command execution..

1. Install Java, install Jenkins, install Docker
2. Add jenkins as user: net user jenkins /add
3. Add docker to local user: net localgroup docker /add
4. Then give docker daemon access to Jenkins: net localgroup docker jenkins /add
5. Tell Jenkinsfile as agent any and targe to localhost docker:
    agent any
    environment {
        DOCKER_HOST = 'tcp://localhost:2375'
    }
