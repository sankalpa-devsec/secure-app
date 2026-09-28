# හිතාමතාම පරණ, CRITICAL ලෙඩ තියෙන base image එකක් දාමු
FROM node:18-alpine

WORKDIR /app
COPY app.js .
USER node
EXPOSE 3000
CMD ["node", "app.js"]
