#!/bin/bash

LICENSE_KEY=abc123

docker run -e OPENALPR_LICENSE_KEY=$LICENSE_KEY -p 8888:8080 --rm openalpr/api
