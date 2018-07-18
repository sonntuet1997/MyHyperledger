#!/usr/bin/env bash
docker-compose -f docker-compose-cli.yaml down --remove-orphans
docker volume rm $(docker volume ls)