FROM ubuntu:14.04
MAINTAINER Matt Hill <matthill@openalpr.com>

RUN apt-get update && \
    apt-get install -y \
    supervisor \
    wget 

# Setup gpg key and deb repo
RUN wget -O - http://deb.openalpr.com/openalpr.gpg.key | sudo apt-key add - && \
    echo "deb http://deb.openalpr.com/commercial/ trusty main" | sudo tee /etc/apt/sources.list.d/openalpr.list

# Install the software
RUN apt-get update && apt-get install -y \
    openalpr \
    openalpr-daemon \
    openalpr-link 

# Pull the alprlc package from the beta repo.  This will not be necessary once it's promoted to ga
# This is avoids having an extra volume mount for the install_id (beta alprlc moves it to /etc/openalpr/)
RUN echo "deb http://deb.openalpr.com/commercial-beta/ trusty main" > /etc/apt/sources.list.d/openalpr.list && \
    apt-get update && apt-get install -y \
        libalprlc2  && \
    echo "deb http://deb.openalpr.com/commercial/ trusty main" > /etc/apt/sources.list.d/openalpr.list

# Adjust beanstalkd to also allow remote connections
RUN sed -i 's/BEANSTALKD_LISTEN_ADDR\s*=\s*127.0.0.1/BEANSTALKD_LISTEN_ADDR=0.0.0.0/' /etc/default/beanstalkd

# Expose the beanstalkd port and the web service
EXPOSE 11300 8355

# Allow the plate images to be persisted on the host
VOLUME /var/lib/openalpr/
VOLUME /etc/openalpr/

WORKDIR ~/

# Override script for "service" to allow alprlink to restart service
COPY service-override /usr/sbin/service

# Startup script for OpenALPR services
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# send over the license key and the alprd configuration
#COPY license.conf /etc/openalpr/license.conf
COPY alprd.conf /etc/openalpr/alprd.conf

CMD ["/usr/bin/supervisord"]
