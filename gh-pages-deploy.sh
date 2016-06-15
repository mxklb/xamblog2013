#!/bin/bash

# Get repo url (should be https://github.com/mxklb/xamblog2013.git)
url=$(git config remote.origin.url)
# Remove 'https://' prefix and '.git' ending to get the repo id
rid=$(echo "${url:8:-4}")
echo "Deploying to $rid ($url)"

cd build
git init
git config user.name "travis"
git config user.email "travis@email.com"
git add .
git commit -m "Deployed to Github Pages"
git push --force --quiet "https://${GH_TOKEN}@$rid" master:gh-pages > /dev/null 2>&1
