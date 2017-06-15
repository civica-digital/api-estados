#!/usr/bin/env bash
set -xeuo pipefail

cp config/dev.secret.exs.example config/dev.secret.exs

docker-compose build web
docker-compose run --rm web bash -c 'mix do deps.get, compile && mix test'
