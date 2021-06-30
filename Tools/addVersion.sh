#!/bin/bash

RELEASE_TAG=$1

if [ "${RELEASE_TAG}nothing" == "nothing" ]; then
	echo "Please give a release tag, e.g., 0.12.1"
	exit
fi

echo "Adding release tag: $RELEASE_TAG"

git add -A
git commit -m "version $RELEASE_TAG"
git tag -a "$RELEASE_TAG" -m "version $RELEASE_TAG"
git push
git push --tags
