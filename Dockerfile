# 1. Use the modern Python 3.12 Bookworm base
FROM python:3.12-slim-bookworm

WORKDIR /app

# 2. Update package list and install minimal dependencies for AWS CLI (curl/unzip if needed)
# Using apt-get is preferred for scripting over the standard 'apt'
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl unzip && \
    rm -rf /var/lib/apt/lists/*

# 3. Install AWS CLI using pip (Recommended for Python environments)
# This bypasses the apt repository error entirely
RUN pip install --no-cache-dir awscli

# 4. Copy app files and install project dependencies
COPY . /app
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]