# Use Python 3.6 or later as a base image
FROM python:latest

WORKDIR /app
# Copy contents into image
COPY . .
# Install pip dependencies from requirements
RUN pip install Flask
# Set YOUR_NAME environment variable
ENV YOUR_NAME="Michael"
ENV HOSTNAME="ec2-13-40-187-211.eu-west-2.compute.amazonaws.com"
# Expose the correct port
EXPOSE 5500
# Create an entrypoint
ENTRYPOINT ["python", "app.py"]
