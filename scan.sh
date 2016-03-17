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

    # by default will supress some output, this is personal preference but can be overridden with a SNYK_NOISY env var
    if [ "$SNYK_NOISY" ]; then
        snyk test

    else
        snyk test \
            | grep -v 'No direct dependency upgrade can address this issue.' \
            | grep -v 'Run `snyk wizard` to explore remediation options.' \
            | grep -v 'Run `snyk wizard` to address these issues.'
    fi

    echo 'NSP security check:'
    echo '--------------------'
    nsp check

else
    echo
    echo "Error installing packages - not scanning :("
    echo
fi
