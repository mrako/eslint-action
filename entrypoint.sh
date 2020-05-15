#!/bin/sh

# Exit if any subcommand fails
set -e

options=""

# Setup node modules if needed
if [ -e node_modules/.bin/eslint ]; then
    setup=""
else
    echo "## Your environment is not ready yet. Installing modules..."
    if [ -f yarn.lock ]; then
        setup="yarn --non-interactive --silent --ignore-scripts --production=false &&"
    elif [ -f package-lock.json ]; then
        setup="NODE_ENV=development npm ci --ignore-scripts &&"
    elif [ -f package.json ]; then
        setup="NODE_ENV=development npm install --no-package-lock --ignore-scripts &&"
    else
        setup="NODE_ENV=development npm install --no-package-lock --ignore-scripts eslint babel-eslint &&"
    fi
fi

if [ ! -f .eslint* ]; then
    sh -c "cp /.eslintrc.json ./.eslintrc.json"
fi

if [ -z "$1" ]; then
    glob="."
else 
    glob="$@"
fi

echo "## Running ESLint"
sh -c "$setup ./node_modules/.bin/eslint $glob"
