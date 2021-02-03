pipeline {
    agent {
      kubernetes {
        defaultContainer 'node'
        yaml """
  kind: Pod
  spec:
    containers:
    - name: node
      image: node:15.7.0
      command:
      - cat
      tty: true
    - name: openapi
      image: openapitools/openapi-generator-cli:v5.0.0
      imagePullPolicy: Always
      command:
        - cat
      tty: true
      securityContext:
        allowPrivilegeEscalation: false
  """
      }
    }
    environment {
        CI = 'true'
        DISCORD_WEBHOOK_URL = credentials('discord_webhook_url')
    }
    options {
        ansiColor('xterm')
    }
    stages {
        stage('Build & publish') {
            when {
                tag '*'
            }
            environment {
                NODE_AUTH_TOKEN = credentials('node_auth_token')
            }
            steps {
                sh 'yarn install'
                container(name: 'openapi', shell: '/bin/bash') {
                    sh 'ls -la'
                    sh '/usr/local/bin/docker-entrypoint.sh generate -i api.yaml -g typescript-axios -o src'
                }
                sh 'yarn build'
                sh 'git config --global user.email "${GIT_AUTHOR_NAME}"'
                sh 'git config --global user.name "${GIT_AUTHOR_EMAIL}"'
                sh 'echo ${TAG_NAME}'
                sh 'echo "//registry.npmjs.org/:_authToken=${NODE_AUTH_TOKEN}" > ~/.npmrc'
                sh 'yarn publish --access public --new-version ${TAG_NAME}'
            }
        }
    }
    post {
        always {
            discordSend description: "Jenkins Pipeline Build", footer: "Footer Text", link: env.BUILD_URL, result: currentBuild.currentResult, title: JOB_NAME, webhookURL: env.DISCORD_WEBHOOK_URL
        }
    }
}
