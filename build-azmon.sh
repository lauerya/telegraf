#!/bin/bash

DATE="$(date +%s)"
COMMIT="$(git rev-parse --short HEAD)"
BRANCH="$(git rev-parse --abbrev-ref HEAD)"

GOOS=linux GOARCH=amd64 go build -i -ldflags "-X main.commit=${COMMIT} -X main.version=${DATE} -X main.branch=${BRANCH}" ./cmd/telegraf

scp -i ~/.ssh/azure_telegraf_testing ./telegraf gunnar@52.171.33.166:

rm telegraf
