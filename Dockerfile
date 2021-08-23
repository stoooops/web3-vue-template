# build stage
FROM node:lts-alpine
# as build-stage

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY tsconfig.json ./
COPY *.js ./
COPY src src

RUN npm run build

EXPOSE 8080
CMD [ "npm", "run", "serve"]

# # production stage
# FROM nginx:stable-alpine as production-stage
# COPY --from=build-stage /app/dist /usr/share/nginx/html
# CMD ["nginx", "-g", "daemon off;"]
