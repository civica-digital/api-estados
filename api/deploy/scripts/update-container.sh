#!/usr/bin/env bash

((${#} != 1)) && echo "Usage: update-container.sh image"

set -xeuo pipefail

image=${1}
region=${2}
group=${3}
stream=${4}
directory=${5}

# Login to AWS registry
eval $(aws ecr get-login --region us-east-1)

cd ${directory}

# Get latest image
docker pull ${image}

# Update the docker-compose with the latest image
sed -i "s#image.*amazon.*#image: ${image}#g" docker-compose.yml

docker-compose stop web
docker-compose rm -f web

# Spin up everything
docker-compose up -d

# Run migrations
docker-compose run --rm --name migrations web mix ecto.migrate
