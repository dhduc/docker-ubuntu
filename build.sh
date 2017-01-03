#!/bin/bash

IMAGE='huuduc2107/ubuntu'
echo "Start build $IMAGE image"
docker build -t  $IMAGE .