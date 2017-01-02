#!/bin/bash

IMAGE='ducdh/ubuntu'
echo "Start build $IMAGE image"
docker build -t  $IMAGE .