#!/bin/bash

echo "Configurando o Docker para usar o daemon do Minikube..."
eval $(minikube docker-env)

echo "Criando as imagens.........."

docker build -t joaocffarias/projeto-backend:1.0 backend/.
docker build -t joaocffarias/projeto-database:1.0 database/.

# echo "Enviando as imagens para o Docker Hub.........."
# docker push joaocffarias/projeto-backend:1.0
# docker push joaocffarias/projeto-database:1.0

echo "Aplicando os arquivos do Kubernetes.........."

kubectl apply -f services.yml
kubectl apply -f deployment.yml
