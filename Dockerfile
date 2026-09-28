# 1. අලුත්ම ස්ථාවර LTS Alpine image එක
FROM node:22-alpine

# 2. OS එකේ security patches update කරගැනීම
RUN apk update && apk upgrade --no-cache

# 3. වැඩ කරන folder එක
WORKDIR /app

# 4. Code එක copy කිරීම
COPY app.js .

# 5. Non-root user
USER node

EXPOSE 3000

CMD ["node", "app.js"]
