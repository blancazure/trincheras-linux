#!/bin/bash

# Actualiza la lista de paquetes disponibles y sus versiones
apt-get update

# Instala las versiones más recientes de todos los paquetes actualmente instalados en el sistema
apt-get upgrade -y