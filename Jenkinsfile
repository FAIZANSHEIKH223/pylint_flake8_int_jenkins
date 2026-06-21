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
                flake8 .
                '''
            }
        }

        stage('Pylint') {
            steps {
                sh '''
                . venv/bin/activate
                pylint app.py
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

        success {
            echo 'Build Successful'
        }

        failure {
            echo 'Build Failed'
        }

    }
}
