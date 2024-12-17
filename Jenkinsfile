// TODO: Amend Jenkinsfile
pipeline {
    environment {
        registry = 'registry-intl.ap-southeast-1.aliyuncs.com/swmeng/meditrax-'
        registryCredential = 'aliclouddocker'
        SERVER_IP = credentials('ALICLOUD_ECS_HK_IP')
        DOCKER_CREDENTIALS = credentials('aliclouddocker')
        DOCKER_BUILDKIT = '1'
    }
    agent any
    stages {
        stage('Build Images') {
            steps{
                script {
                    clientImage = docker.build(registry + 'client', "--build-arg ENABLED_MODULES=\"brotli\" --build-arg BUILD_NUM=$BUILD_NUMBER --memory 2000m ./client")
                    serverImage = docker.build(registry + 'server', '--build-arg ENABLED_MODULES="brotli" ./server')
                }
            }
        }
        stage('Push Images') {
            steps {
                script {
                    docker.withRegistry('https://registry-intl.ap-southeast-1.aliyuncs.com', registryCredential ) {
                        clientImage.push("${env.BUILD_NUMBER}")
                        serverImage.push("${env.BUILD_NUMBER}")
                        clientImage.push('latest')
                        serverImage.push('latest')
                    }
                }
            }
        }
        stage('Remove Unused Docker Image') {
            steps {
                sh "docker rmi ${registry}client"
                sh "docker rmi ${registry}server"
            }
        }
        stage('Deploy Images') {
            steps {
                sshagent(credentials:['ALICLOUD_HONG_KONG_SERVER_KEY']) {
                    // sh 'ssh -o StrictHostKeyChecking=no root@47.254.213.218 \"rm -rf deploy/\"'
                    sh "scp -o StrictHostKeyChecking=no -r ./deploy/* root@$SERVER_IP:/root/jomfi-einvoice"
                    sh "ssh -o StrictHostKeyChecking=no root@$SERVER_IP \"export BUILD_NUMBER=${env.BUILD_NUMBER} && docker login -u $DOCKER_CREDENTIALS_USR -p $DOCKER_CREDENTIALS_PSW registry-intl.ap-southeast-1.aliyuncs.com && cd /root/jomfi-einvoice/ && sh ./deploy.sh\""
                }
            }
        }
        // stage('Refresh CDN') {
        //   agent {
        //     dockerfile {
        //       dir './cdn_refresh/'
        //     }
        //   }
        //   steps {
        //     sh 'python3 /app/Refresh.py -i $CDN_REFRESH_USR -k $CDN_REFRESH_PSW -r /app/url.lst -t clear -o Directory'
        //   }
        // }
        // stage('Notify Webhook') {
        //     steps {
        //         sh ('curl -H \"Content-Type: application/json\" -d \'{\"username\": \"Jenkins\", \"content\": \"E-Invoice Build \'\"$BUILD_NUMBER\"\' completed!\"}\' $DISCORD_WEBHOOK')
        //     }
        // }
    }
}
