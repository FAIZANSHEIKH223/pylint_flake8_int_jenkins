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
                flake8 . --format=pylint > flake8-report.txt || true
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

    }

    post {

        always {
            recordIssues(
                tools: [
                    flake8(pattern: 'flake8-report.txt'),
                    pyLint(pattern: 'pylint-report.txt')
                ]
            )
        }

        success {
            echo 'Build Successful'
        }

        failure {
            echo 'Build Failed'
        }

    }
}
