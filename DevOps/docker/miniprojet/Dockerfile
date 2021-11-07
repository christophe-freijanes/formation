FROM python:2.7-stretch
MAINTAINER cfreijanes (cfreijanes@gmx.fr)
# Set working directory to the code location
WORKDIR /
# Dependencies for the system
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get install python-dev python3-dev libsasl2-dev python-dev libldap2-dev libssl-dev -y
# Installation Flask
RUN pip install flask==1.1.2 flask_httpauth==4.1.0 flask_simpleldap python-dotenv==0.14.0
# Configure network for API
EXPOSE 5000
# Configuration volume /data
VOLUME [/data]
# Clone repo API to /
# RUN git clone https://github.com/diranetafen/student-list.git /
# Copy the file student_age.json to /data
COPY /student-list/simple_api/student_age.json /data/
# Run the server python and start api
CMD [ "python", "./student_age.py" ]
