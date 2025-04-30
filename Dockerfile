#dockerbuild
FROM node:18.20.8-slim
WORKDIR /app
ADD . /app/
RUN npm install
#dockerrun
CMD ["nmp","start "]
