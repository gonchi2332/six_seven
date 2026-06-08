FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
RUN mkdir -p dist/helpers && cp src/helpers/mail.html dist/helpers/mail.html
EXPOSE 3000
CMD ["npm", "run", "start"]
