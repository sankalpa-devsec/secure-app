FROM node:22-alpine
RUN apk update && apk upgrade --no-cache
WORKDIR /app
COPY app.js .
USER node
EXPOSE 3000
CMD ["node", "app.js"]
