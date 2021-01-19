#!/bin/bash

set -e

DEST="${JEKYLL_DESTINATION:-_site}"
#REPO="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
#BRANCH="gh-pages"

echo "Installing gems..."

#bundle config path vendor/bundle
bundle install

echo "Building Jekyll site..."

JEKYLL_ENV=production bundle exec jekyll build

echo "Publishing..."

cd ${DEST}

git init
#git config user.name "${GITHUB_ACTOR}"
#git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add .
git commit -m "blog"
#git push --force ${REPO} master:${BRANCH}
git push
