#!/bin/bash

LICENSE_KEY="licensekeygoeshere"

docker run -P -e OPENALPR_LICENSE_KEY=$LICENSE_KEY -v openalpr-vol1-config:/etc/openalpr/ -v openalpr-vol1-runtime:/usr/share/openalpr/ -v openalpr-vol1-images:/var/lib/openalpr/plateimages/ -it openalpr/commercial-agent /bin/bash #alprlink-register
