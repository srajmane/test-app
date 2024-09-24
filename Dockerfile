FROM python:3.9-alpine

# Set the working directory
WORKDIR /backend_api

# Copy requirements.txt and install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000

# Set the command to run the app
CMD ["python3", "app.py"]
