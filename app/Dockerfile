
# Use a stable Python image as the base
FROM python:3.11-slim

# Set environment variables to ensure the app runs in a predictable environment
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Set the working directory inside the container
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose the Flask app port
EXPOSE 5000

# Run the application
CMD ["flask", "run"]
