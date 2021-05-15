# Uset for production build. Serve the app with NGINX

FROM node:16-alpine3.11
WORKDIR /myapp
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=0 /myapp/build /usr/share/nginx/html

