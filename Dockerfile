FROM node:22.4.1-slim as builder 

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
COPY .env.docker .env
RUN npm run build

FROM nginx:1.27.0-alpine

COPY --from=builder /app/dist /usr/share/nginx/html
COPY /nginx/default.conf /etc/nginx/conf.d/default.conf

# add env.sh to docker-entrypoint.d
COPY env.sh /docker-entrypoint.d/env.sh
# 給 env.sh 可被執行的權限
RUN chmod +x /docker-entrypoint.d/env.sh

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]