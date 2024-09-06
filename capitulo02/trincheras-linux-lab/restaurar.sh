#!/bin/bash

# Establecer el prompt para la selección de la máquina virtual
PS3="Selecciona una MV: "

# Bucle infinito para mostrar el menú hasta que se elija salir
while true; do
  # Limpiar la pantalla
  clear
  
  # Mostrar el menú de selección de máquina virtual
  select MV in ubuntu fedora Todas Salir
  do
    case $REPLY in
      # Si se elige una de las máquinas virtuales específicas
      1|2)
        echo "Restaurando mv-lab-docker-$MV..."
        
        # Ejecutar el script de restauración correspondiente a la máquina virtual seleccionada
        ./restaurar-$MV.sh
        
        # Esperar 3 segundos antes de continuar
        sleep 3
        
        # Salir del bucle select
        break
        ;;

      # Si se elige restaurar todas las máquinas virtuales
      5)
        echo "Restaurando todas las MV..."
        
        # Ejecutar el script de restauración para todas las máquinas virtuales
        ./restaurar-todas.sh
        
        # Salir del bucle select y del bucle while
        break 2
        ;;

      # Si se elige salir
      6)
        # Salir del bucle select y del bucle while
        break 2
        ;;

      # Para cualquier otra entrada inválida
      *)
        echo "Segmentation fault (core dumped)"
        
        # Esperar 1 segundo antes de continuar
        sleep 1
        
        # Salir del bucle select
        break;
        ;;
    esac
  done
done
