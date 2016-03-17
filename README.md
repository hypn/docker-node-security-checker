# Usage

Builds and image with "snyk" and "nps", and a "/tmp/scan.sh" script to look for vulnerabilities against
"/src/packages.json".

To start this container:

    docker run -v {node_project_path}:/src -e NPM_REGISTRY="{custom_npm_registry}" node_security_scan
