#!/bin/bash

# Mostrar la fecha y la hora actuales
echo "Fecha y hora actuales: $(date)"

# Mostrar el uso del disco
echo -e "\nUso del disco:"
df -h

# Mostrar la memoria libre y usada
echo -e "\nEstado de la memoria:"
free -h

# Mostrar el tiempo de actividad del sistema
echo -e "\nTiempo de actividad del sistema:"
uptime

# Mostrar los 5 procesos que más consumen CPU
echo -e "\nLos 5 procesos que más consumen CPU:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6
