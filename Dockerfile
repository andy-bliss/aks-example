# Use the official lightweight Python image
FROM python:3.13-slim

# Don't write .pyc files (the root filesystem is read-only when running in Kubernetes)
# and don't buffer stdout/stderr so logs appear immediately
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

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

# Switch to non-root user (numeric, so Kubernetes can verify it is not root)
USER 1000

# Expose the port the app runs on
EXPOSE 5000

# Run with gunicorn, a production WSGI server, rather than Flask's development server
# --no-control-socket: the control socket needs a writable home directory, which a read-only root filesystem doesn't have
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "2", "--access-logfile", "-", "--no-control-socket", "app:app"]
