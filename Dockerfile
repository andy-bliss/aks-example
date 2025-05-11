# Use the official lightweight Python image
FROM python:3.13-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the python subdirectory into the container
COPY python/ ./python/

# Set the working directory to the subdirectory
WORKDIR /app/python

# Install Flask
RUN pip install flask

# Expose the port the app runs on
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]
