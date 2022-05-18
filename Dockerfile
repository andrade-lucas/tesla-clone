FROM node:12.2.0-alpine as build

RUN mkdir /app

WORKDIR /app

COPY package*.json /app/
COPY yarn.lock /app/

#copy the react app to the container
COPY . /app/

#prepare the container for building react
RUN npm install

RUN npm run build

#prepare nginx
FROM nginx:1.16.0-alpine
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx/nginx.conf /etc/nginx/conf.d

#fire up nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
