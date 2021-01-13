#!/bin/bash

docker build -t carolinavicente .
docker stop carolinavicente

docker run -d --rm -p 8000:8000 \
  --env-file $HOME/carolinavicente.env \
  --name carolinavicente \
  -v $(pwd)/dkdata:/dkdata \
  carolinavicente start.sh
