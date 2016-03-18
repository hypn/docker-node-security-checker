# Usage

Builds and image with "snyk" and "nps", and a "/tmp/scan.sh" script to look for vulnerabilities in your node project. It
expects your code to be mounted at "/src" (see command below) and "node_modules" to already be installed (so consider
running "npm install" before running this).

To start this container:

    docker run -v {node_project_path}:/src node_security_scan

Some snyk messages (mostly around running the wizard) are surpressed, run the above command but setting an env variable:

    -e SNYK_NOISY=true
