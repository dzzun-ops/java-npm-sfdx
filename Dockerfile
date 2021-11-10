FROM openjdk:16-slim-buster

RUN apt-get update; apt-get install -y curl \
    && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && curl -L https://www.npmjs.com/install.sh | sh 

RUN npm install --global lodash@4.17.15
RUN npm install --global sfdx-cli --unsafe-perm=true --allow-root
RUN sfdx plugins:install @salesforce/sfdx-scanner
RUN sfdx update
RUN sfdx plugins --core
RUN node -v
RUN npm -v
