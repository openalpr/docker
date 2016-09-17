#!/bin/bash

LICENSE_KEY="licensekeygoeshere"

docker run -P -e OPENALPR_LICENSE_KEY=$LICENSE_KEY -v openalpr-vol1:/etc/openalpr/ -v openalpr-vol1:/usr/share/openalpr/install_id -v openalpr-vol1:/var/lib/openalpr/plateimages/ -it openalpr/commercial-agent alprlink-register