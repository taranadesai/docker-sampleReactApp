FROM node:alpine as Builder

WORKDIR '/app'

COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# nginx automatically starts the server after this, so we dont need startup command