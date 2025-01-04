# Base Image
FROM --platform=linux/amd64 python:3.11-slim

# Set working directory inside the container
WORKDIR /app
COPY backend/requirements.txt /app/requirements.txt





# Copy the backend and database folders
COPY backend /app/backend
COPY database /app/database
COPY environment /app/environment

# Install Google Chrome
# Install Chromium
# RUN apt-get update && apt-get install -y \
#     chromium \
#     chromium-driver && \
#     apt-get clean && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir -r requirements.txt
RUN playwright install chrome


    # Install Python dependencies


# Copy the backend requirements file


# Set environment variables (optional)
ENV PYTHONPATH=/app

# Expose the app port
EXPOSE 8000

# Run the FastAPI application
CMD ["uvicorn", "backend.app.main:app", "--host", "0.0.0.0", "--port", "8000"]
