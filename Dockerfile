ARG NODEVERSION
FROM node:$NODEVERSION-alpine3.11 AS build
RUN apk add git && \
git clone https://github.com/nodejs/nodejs.org.git && \
cd /nodejs.org && \
npm install && \
npm run-script build
FROM nginx:1.21-alpine
WORKDIR /jsapp
COPY --from=build /nodejs.org/build .
