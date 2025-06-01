# Étape 1: Builder
FROM node:20 AS builder
WORKDIR /app

# Facultatif : si tu n'as pas besoin d'un .npmrc, supprime cette ligne
COPY .npmrc .npmrc

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

# Étape 2: Image finale
FROM node:20-slim AS final
WORKDIR /app

# Créer un utilisateur non-root
RUN useradd -m appuser

COPY --from=builder /app /app
RUN chown -R appuser /app

USER appuser
EXPOSE 3001

CMD ["node", "server/server.js"]
