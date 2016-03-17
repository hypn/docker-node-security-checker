#!/bin/sh
echo 'Running security scan...'
echo

cp /src/package.json /tmp
cd /tmp

# support custom NPM registries
if [ "$NPM_REGISTRY" ]; then
    echo "Setting NPM registry to: $NPM_REGISTRY"
    echo 'doing an "npm install" so this might take a little while...'
    npm set registry $NPM_REGISTRY
fi

npm install --production

if [ $? -eq 0 ]; then
    clear

    echo 'Synk security check:'
    echo '--------------------'
    snyk test

    echo
    echo 'NSP security check:'
    echo '--------------------'
    nsp check

else
    echo
    echo "Error installing packages - not scanning :("
    echo
fi
