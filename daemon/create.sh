#!/bin/bash

docker build -t openalpr/commercial-agent .

# to run: 
# sudo docker run -P -v /tmp/plateimages:/var/lib/openalpr/plateimages/ -i -t openalpr/alprd
