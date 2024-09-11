#!/bin/bash

# Se crea un directorio oculto que será utilizado en los ejemplos
mkdir ~/trincheras-linux/capitulo05/estructura/.directorio-oculto

# Se cambia el propietario del respositorio clonado para no tener problemas de permisos
chown -R vagrant:vagrant ~/trincheras-linux

# Declaramos los grupos
grupos=("desarrollo" "implantacion" "soporte")

# Usuarios asignados a cada grupo
usuarios_desarrollo=("jblanco" "amartinez" "ilopez" "dalvarez" "icuesta")
usuarios_implantacion=("aperez" "scernadas")
usuarios_soporte=("ebarbosa" "jirago")

# Crear los grupos de usuarios
for grupo in "${grupos[@]}"
do
    # Comando para crear el grupo (usar sudo si es necesario)
    sudo groupadd "$grupo"
    echo "Grupo creado: $grupo"
done

# Asignar los usuarios al grupo desarrollo
for usuario in "${usuarios_desarrollo[@]}"
do
    # Crear el usuario y asignarlo al grupo desarrollo
    sudo useradd -G desarrollo "$usuario"
    echo "Usuario creado: $usuario y asignado al grupo desarrollo"
done

# Asignar los usuarios al grupo implantacion
for usuario in "${usuarios_implantacion[@]}"
do
    # Crear el usuario y asignarlo al grupo implantacion
    sudo useradd -G implantacion "$usuario"
    echo "Usuario creado: $usuario y asignado al grupo implantacion"
done

# Asignar los usuarios al grupo soporte
for usuario in "${usuarios_soporte[@]}"
do
    # Crear el usuario y asignarlo al grupo soporte
    sudo useradd -G soporte "$usuario"
    echo "Usuario creado: $usuario y asignado al grupo soporte"
done


