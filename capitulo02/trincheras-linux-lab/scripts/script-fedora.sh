#!/bin/bash

# Actualiza la lista de paquetes disponibles y sus versiones
dnf update -y

# Se deshabilita el servicio NetworkManager-wait-online
sudo systemctl disable NetworkManager-wait-online.service