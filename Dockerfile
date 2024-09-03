FROM node:20.14.0 as build
#FROM node:20.14.0 

WORKDIR /app

COPY package*.json ./

RUN npm install
RUN npm install -g @angular/cli

COPY . .

# CMD ["ng","serve","--host","0.0.0.0"]
# EXPOSE 4200

RUN ng build

FROM nginx:latest
COPY --from=build /app/dist/github-actions-sample/browser /usr/share/nginx/html
EXPOSE 80