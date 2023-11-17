FROM node:18-alpine
RUN apk add --no-cache python3 g++ make
WORKDIR /app
COPY . .
ENV TODAY=IS_CONTAINER
RUN npm install
CMD ["npm", "start"]