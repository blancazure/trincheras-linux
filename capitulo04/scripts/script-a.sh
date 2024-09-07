#!/bin/bash

# Mostrar el nombre del host
echo "Nombre del host: $(hostname)"

# Mostrar la memoria total del sistema
echo "Memoria total: $(free -h | grep Mem | awk '{print $2}')"

# Mostrar el espacio libre en disco
echo "Espacio en disco libre: $(df -h / | grep / | awk '{print $4}')"
