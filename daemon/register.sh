#!/bin/bash

docker run -P -v agentconfig:/etc/openalpr/ -v agentruntime:/usr/share/openalpr/ -v /tmp/plateimages:/var/lib/openalpr/plateimages/ -it openalpr/commercial-agent alprlink-register
