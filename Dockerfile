FROM    mhart/alpine-node

RUN     npm install -g snyk nsp

COPY    scan.sh /tmp
RUN     chmod +x /tmp/scan.sh

CMD     /tmp/scan.sh
