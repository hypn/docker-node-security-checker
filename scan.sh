#!/bin/sh
echo 'Running security scan...'
echo

cd /src

echo 'Synk security check:'
echo '--------------------'

# by default will supress some output, this is personal preference but can be overridden with a SNYK_NOISY env var
if [ "$SNYK_NOISY" ]; then
    snyk test

else
    snyk test \
        | grep -v 'No direct dependency upgrade can address this issue.' \
        | grep -v 'Run `snyk wizard` to explore remediation options.' \
        | grep -v 'Run `snyk wizard` to address these issues.' \
        | grep -v 'Next steps:' \
        | grep -v 'Run `snyk monitor` to be notified about new related vulnerabilities.' \
        | grep -v 'Run `snyk test` as part of your CI/test.'
fi

echo 'NSP security check:'
echo '--------------------'
nsp check
