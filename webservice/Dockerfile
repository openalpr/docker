FROM openalpr/commercial-agent
MAINTAINER Matt Hill <matthill@openalpr.com>


RUN apt-get update && apt-get install -y python-pip python-openalpr

COPY src/requirements.txt /opt/openalprapi/

RUN pip install -r /opt/openalprapi/requirements.txt

# send over the license key 
#COPY license.conf /etc/openalpr/license.conf

COPY src/webservice.py /opt/openalprapi/

EXPOSE 8080

CMD ["python", "/opt/openalprapi/webservice.py", "-p", "8080"]
