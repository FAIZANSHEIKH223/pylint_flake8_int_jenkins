pipeline {

    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/FAIZANSHEIKH223/pylint_flake8_int_jenkins.git'
            }
        }

        stage('Create Venv') {
            steps {
                sh '''
                python3 -m venv venv
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                . venv/bin/activate
                pip install --upgrade pip
                pip install -r requirements.txt
                '''
            }
        }

        stage('Flake8') {
            steps {
                sh '''
                . venv/bin/activate
                flake8 . --format=html --htmldir=flake8-report || true
                '''
            }
        }

        stage('Pylint') {
            steps {
                sh '''
                . venv/bin/activate
                pylint app.py > pylint-report.txt || true
                '''
            }
        }

        stage('Unit Test') {
            steps {
                sh '''
                . venv/bin/activate
                pytest
                '''
            }
        }

        stage('Pylint HTML Report') {
            steps {
            sh '''
            . venv/bin/activate

                pylint app.py --output-format=json > pylint.json || true

                pylint-json2html \
                    -f json \
                    -o pylint-report.html \
                    pylint.json
                '''
            }

        }
    }
    post {

        always {
            publishHTML([ allowMissing: true, alwaysLinkToLastBuild: true, keepAll: true, reportDir: '.', reportFiles: 'pylint-report.html', reportName: 'Pylint HTML Report' ])
        }

        success {
            echo 'Build Successful'
        }

        failure {
            echo 'Build Failed'
        }

    }
}
