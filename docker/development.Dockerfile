FROM node:argon
MAINTAINER Matías Lescano <matias@democraciaenred.org>

ENV NODE_PATH=. \
    DEBUG="civicstack*"

COPY ["package.json", "/usr/src/"]

WORKDIR /usr/src

RUN npm install --quiet --unsafe-perm

COPY [".", "/usr/src/"]

RUN node ./bin/civicstack-install --config && \
    node ./bin/civicstack-config && \
    node ./bin/civicstack-build

EXPOSE 3000

CMD ["node", "index.js"]
