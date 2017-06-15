#!/usr/bin/env bash
set -xeuo pipefail

echo "DEPLOY_ENVIRONMENT = ${DEPLOY_ENVIRONMENT}"
echo "REPOSITORY = ${REPOSITORY}"
echo "REGISTRY = ${REGISTRY}"
echo "REMOTE_HOST = ${REMOTE_HOST}"
echo "UPDATE_REMOTE_HOST_SCRIPT = ${UPDATE_REMOTE_HOST_SCRIPT}"
echo "AWSLOGS_REGION" = ${AWSLOGS_REGION}
echo "AWSLOGS_GROUP" = ${AWSLOGS_GROUP}
echo "AWSLOGS_STREAM" = ${AWSLOGS_STREAM}
echo "HOST_DIRECTORY" = ${HOST_DIRECTORY}

# Jenkins env_vars
echo "BUILD_NUMBER = ${BUILD_NUMBER}"
echo "WORKSPACE = ${WORKSPACE}"

# Script to update server container(s)

# Remove protocol
image="${REGISTRY//http[s]:\/\/}/${REPOSITORY}"
build_tag="${image}:v_${BUILD_NUMBER}"
latest_tag="${image}:latest"

if [[ "${DEPLOY_ENVIRONMENT}" == "production" ]]; then
  image+="-production"
  build_tag="${image}:${tag}"
fi

docker build \
  --tag ${build_tag} \
  --no-cache=true \
  --pull=true \
  ${WORKSPACE}

docker tag ${build_tag} ${latest_tag}

# Login to AWS registry
eval $(aws ecr get-login --region us-east-1)

# Upload to the registry
docker push ${build_tag}
docker push ${latest_tag}

# Remove from Jenkins (that's why we are using the registry!)
docker rmi ${build_tag}
docker rmi ${latest_tag}

# Connect to remote host and update it
ssh ${REMOTE_HOST} \
  bash -s < ${UPDATE_REMOTE_HOST_SCRIPT} ${build_tag} ${AWSLOGS_REGION} ${AWSLOGS_GROUP} ${AWSLOGS_STREAM} ${HOST_DIRECTORY}
