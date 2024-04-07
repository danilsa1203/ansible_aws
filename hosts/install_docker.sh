#!/bin/bash

# Actualiza los paquetes existentes
sudo apt-get update

# Instala los paquetes necesarios para permitir el uso de repositorios sobre HTTPS
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Agrega la clave GPG oficial de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Agrega el repositorio de Docker al sistema
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Actualiza nuevamente los paquetes e instala Docker
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Añade tu usuario al grupo docker para poder ejecutar comandos docker sin sudo
sudo usermod -aG docker $USER
