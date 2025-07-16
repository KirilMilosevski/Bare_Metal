# Build stage
FROM node:18-alpine as builder

WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY ./src ./src

# Run stage
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app /app
EXPOSE 3000
CMD ["node", "src/index.js"]
