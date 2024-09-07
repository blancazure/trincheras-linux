#!/bin/bash

# Mostrar el nombre del host
echo "Nombre del host: $(hostname)"

# Mostrar la memoria libre del sistema
echo "Memoria libre: $(free -h | grep Mem | awk '{print $4}')"

# Mostrar el espacio libre en disco
echo "Espacio en disco libre: $(df -h / | grep / | awk '{print $4}')"

# Mostrar el tiempo de actividad del sistema
echo "Tiempo de actividad: $(uptime -p)"
