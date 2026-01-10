# 1. Use the current stable Python 3.12 slim image on Debian Bookworm
FROM python:3.12-slim-bookworm

# 2. Set environment variables to optimize Python performance
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# 3. Install system dependencies in one layer and clean up to save space
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    libsm6 \
    libxext6 \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# 4. Use a separate layer for requirements to leverage Docker cache
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the application code
COPY . .

# 6. Use a non-root user for security (Production Best Practice)
RUN useradd -m appuser
USER appuser

# 7. Use an executable list for CMD
EXPOSE 8080
CMD ["python3", "app.py"]
