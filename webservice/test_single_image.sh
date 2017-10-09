#!/bin/bash

curl -s -X POST -F name=file -F "image=@sample.jpg" 'http://localhost:8888/v1/identify/plate?country=us'
