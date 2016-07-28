#!/bin/bash

LICENSE_KEY="licensekeygoeshere"

docker run -P -e OPENALPR_LICENSE_KEY=$LICENSE_KEY -v agentconfig:/etc/openalpr/ -v agentruntime:/usr/share/openalpr/ -v /tmp/plateimages:/var/lib/openalpr/plateimages/ -it openalpr/commercial-agent 
