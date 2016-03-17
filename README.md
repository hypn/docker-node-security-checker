# Usage

Builds and image with "snyk" and "nps", and a "/tmp/scan.sh" script to look for vulnerabilities against
"/src/packages.json".

To start this container:

    docker run -v {node_project_path}:/src node_security_scan

Additionally environment variables can be passed in

1. Specify an NPM registry to use (eg: if you're running a private npm registry)

    -e NPM_REGISTRY="{custom_npm_registry}"

2. Prevent the suppression of snyk messages (mostly around running the wizard)

    -e SNYK_NOISY=true
