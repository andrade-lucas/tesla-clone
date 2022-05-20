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
FROM nginx
COPY nginx/nginx.conf /etc/nginx/conf.d
COPY --from=build /app/dist /usr/share/nginx/html

#fire up nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
