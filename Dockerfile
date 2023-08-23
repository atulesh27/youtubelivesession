# Use an official Python runtime as the base image
FROM python:3.8.13-slim-buster

# Set the working directory within the container
WORKDIR /usr/src/app

# Prevent Python from writing bytecode files
ENV PYTHONDONTWRITEBYTECODE 1

# Prevent Python from buffering stdout and stderr
ENV PYTHONUNBUFFERED 1

# Upgrade pip to the latest version
RUN pip install --no-cache-dir --upgrade pip

# Copy the requirements file to the working directory
COPY requirement.txt /usr/src/app/

# Install project dependencies
RUN pip install --no-cache-dir -r requirement.txt

# Copy the entire project to the working directory
COPY . /usr/src/app/

# Expose port 8000 for the application
EXPOSE 8000

# Set the default command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
