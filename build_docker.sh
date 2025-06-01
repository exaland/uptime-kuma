#!/bin/bash

# Config
IMAGE_NAME="exaland/directalerte"
TAG="custom"
DOCKERFILE="Dockerfile"

# Connexion Docker Hub (interactif si pas déjà connecté)
echo "🔐 Connexion à Docker Hub (exaland)..."
docker login || exit 1

# Construction de l'image
echo "🔧 Construction de l'image Docker..."
docker build -t ${IMAGE_NAME}:${TAG} -f ${DOCKERFILE} . || exit 1

# Push vers Docker Hub
echo "🚀 Push de l'image vers Docker Hub..."
docker push ${IMAGE_NAME}:${TAG} || exit 1

echo "✅ Terminé : ${IMAGE_NAME}:${TAG} est disponible sur Docker Hub."
