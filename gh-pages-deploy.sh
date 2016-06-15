#!/bin/bash
user=$(git config user.name)
mail=$(git config user.email)
repo=$(basename `git rev-parse --show-toplevel`)
branch=$(git rev-parse --abbrev-ref HEAD)

echo "$user($mail)/$repo branch=$branch"

cd build
git init
git config user.name "travis"
git config user.email "travis@email.com"
git add .
git commit -m "Deployed to Github Pages"
git push --force --quiet "https://${GH_TOKEN}@github.com/mxklb/xamblog2013" master:gh-pages > /dev/null 2>&1
