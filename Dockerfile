# ===============================
# Stage 1: Build
# ===============================
FROM node:20-alpine AS builder

WORKDIR /app

# copy package files dulu (biar cache optimal)
COPY package*.json ./

RUN npm install

# copy semua source
COPY . .

RUN npm run build || echo "No build script found, skipping build"

# ===============================
# Stage 2: Production
# ===============================
FROM node:20-alpine

WORKDIR /app

ENV NODE_ENV=production

# copy hanya yang dibutuhkan
COPY package*.json ./
RUN npm install --omit=dev

COPY --from=builder /app .

EXPOSE 3000

CMD ["npm", "start"]