# MLProject

**An End-to-End Machine Learning Application**  
This project contains the full pipeline for building, training, saving, and serving a machine learning model — including deployment options on AWS Elastic Beanstalk and AWS EC2.
[![workflow](https://github.com/ShivamMitra/MLProject/actions/workflows/main.yaml/badge.svg)](https://github.com/ShivamMitra/MLProject/actions/workflows/main.yaml)

---

## 🚀 Overview

This repository demonstrates:
- Data ingestion & preprocessing  
- Model training & evaluation  
- Model serialization  
- REST API for inference using Flask/FastAPI
- Deployment to AWS (Elastic Beanstalk & EC2)

You can run the application locally for development or deploy it to production on the cloud.

---

## 📁 Project Structure
```
.
├── app.py # REST API entrypoint
├── data/ # Dataset & processed data
├── models/ # Serialized model artifacts
├── notebooks/ # EDA & experimentation notebooks
├── src/ # Source modules (train, preprocess, predict)
├── requirements.txt # Python dependencies
├── Dockerfile # Docker container definition
├── README.md # Documentation
├── tests/ # Test cases
└── scripts/ # Utility scripts

```

---

## 🧠 Getting Started

### 🛠 Prerequisites

Make sure you have:
- Python 3.8+ installed
- A virtual environment (recommended)
- AWS CLI configured (if deploying)

Install dependencies:

  ```bash
  pip install -r requirements.txt
  ```

## 🧪 Usage
## 📌 Train the Model

  ```bash
  python src/train.py
  ```
This should train your model and save it to the models/ directory.

## 📌 Run API Locally
  ```bash
  python app.py
  ```
By default, the server will run at:
  ```cpp
  http://127.0.0.1:5000
  ```

Test with curl or Postman:
  ```bash
  curl -X POST http://127.0.0.1:5000/predict \
    -H "Content-Type: application/json" \
    -d '{"features": [1.5, 2.3, ...]}'
  ```

## 🐳 Docker Support (Optional)
Build the Docker image:
  ```bash
  docker build -t mlproject .
  ```
Run the container:
  ```bash
  docker run -p 5000:5000 mlproject
  ```
## ☁️ Deployment
## 🚀 AWS Elastic Beanstalk
AWS Elastic Beanstalk is a platform-as-a-service (PaaS) that automatically provisions and manages infrastructure for running web apps. It makes deployment easier by handling load balancing, scaling, and monitoring.

## How to Deploy:
1. Install Elastic Beanstalk CLI
  ```bash
  pip install awsebcli --upgrade
  ```
2. Initialize Beanstalk
  ```bash
  eb init -p python-3.8 mlproject-app --region <your-region>
  ```
3. Create & Deploy Environment
  ```bash
  eb create mlproject-env
  ```
4. Open App in Browser
  ```bash
  eb open
  ```
Elastic Beanstalk will automatically handle the server, scaling, and health monitoring for you.
💡 Best for: quick deployments with managed infrastructure and autoscaling.

## 🖥 AWS EC2 Deployment
If you need full control over the server environment, you can deploy your ML API on an EC2 instance.

Steps:
1. Launch an EC2 instance (e.g., Ubuntu)
2. SSH into the instance
3. Install Python & dependencies
  ```bash
  sudo apt update
  sudo apt install python3-pip
  pip3 install -r requirements.txt
  ```
4. Transfer your project code (via Git/SSH/SCP)
5. Start the API
  ```bash
  python3 app.py --host 0.0.0.0 --port 80
  ```
6. Configure a process manager (screen, tmux, systemd) to keep it running.
💡 Best for: custom environments, specialized configurations, or full server control.

## 🧪 Testing
Use pytest to run all tests:
  ```bash
  pytest
  ```
Make sure tests cover:
- Model predictions
- API endpoints
- Edge cases

## 🤝 Contributing
Contributions are welcome! Fork the repo, create a branch, and submit a pull request.

## 📜 License
This project is licensed under MIT License.
