# Use the official lightweight Python image
FROM python:3.13-slim

# Set the working directory inside the container
WORKDIR /app

# Create a non-root user for security
RUN useradd -m -u 1000 appuser && \
    chown -R appuser:appuser /app

# Copy requirements file first (better layer caching)
COPY python/requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY python/app.py .

# Switch to non-root user
USER appuser

# Expose the port the app runs on
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]
