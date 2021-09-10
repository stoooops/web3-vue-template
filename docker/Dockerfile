# build stage
FROM node:lts-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY tsconfig.json ./
COPY *.js ./
COPY src src

RUN npm run build
