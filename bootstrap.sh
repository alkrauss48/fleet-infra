#!/usr/bin/env bash

# https://fluxcd.io/flux/installation/bootstrap/github/

# shellcheck disable=SC1091,SC2086,SC2317

if [[ -f ".env" ]]; then
	source .env
else
	echo "No .env file found"
	exit 1
fi

echo $GITHUB_TOKEN | flux bootstrap github \
	--components-extra=image-reflector-controller,image-automation-controller \
	--owner=$GITHUB_USER \
	--repository=$GITHUB_REPO \
	--branch=main \
	--path=./clusters/$CLUSTER \
	--read-write-key \
	--personal
