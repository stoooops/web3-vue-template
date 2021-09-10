# build stage
FROM node:latest AS build-stage

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY tsconfig.json ./
COPY *.js ./
COPY public ./public
COPY src ./src

RUN npm run build
