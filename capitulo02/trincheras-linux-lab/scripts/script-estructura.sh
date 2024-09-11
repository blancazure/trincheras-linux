#!/bin/bash

# Se crea un directorio oculto que será utilizado en los ejemplos
mkdir ~/trincheras-linux/capitulo05/estructura/.directorio-oculto

# Se cambia el propietario del respositorio clonado para no tener problemas de permisos
chown -R vagrant:vagrant ~/trincheras-linux

# Ruta base de las carpetas y archivos
BASE_DIR=~/trincheras-linux/capitulo07

# Grupos y usuario
GRUPO_DESARROLLO="desarrollo"
GRUPO_IMPLANTACION="implantacion"
GRUPO_SOPORTE="soporte"
USUARIO_JBLANCO="jblanco"

# Cambiar permisos y grupos de las carpetas

# 1. Carpeta comun: Acceso para desarrollo, implantacion y soporte
chown :$GRUPO_DESARROLLO $BASE_DIR/comun
chown :$GRUPO_IMPLANTACION $BASE_DIR/comun
chown :$GRUPO_SOPORTE $BASE_DIR/comun
chmod 770 $BASE_DIR/comun

# 2. Carpeta implantacion: Solo acceso grupo implantacion
chown :$GRUPO_IMPLANTACION $BASE_DIR/implantacion
chmod 770 $BASE_DIR/implantacion

# 3. Carpeta soporte: Solo acceso grupo soporte
chown :$GRUPO_SOPORTE $BASE_DIR/soporte
chmod 770 $BASE_DIR/soporte

# 4. Carpeta desarrollo: Solo acceso grupo desarrollo
chown :$GRUPO_DESARROLLO $BASE_DIR/desarrollo
chmod 770 $BASE_DIR/desarrollo

# Cambiar permisos y grupos de los archivos

# 5. Archivos proyecto-android.txt y proyecto-apple.txt: Solo acceso grupo desarrollo
chown :$GRUPO_DESARROLLO $BASE_DIR/desarrollo/proyecto-android.txt
chown :$GRUPO_DESARROLLO $BASE_DIR/desarrollo/proyecto-apple.txt
chmod 660 $BASE_DIR/desarrollo/proyecto-android.txt
chmod 660 $BASE_DIR/desarrollo/proyecto-apple.txt

# 6. Archivo auditoria-enero.txt: Solo acceso grupo implantacion
chown :$GRUPO_IMPLANTACION $BASE_DIR/implantacion/auditoria-enero.txt
chmod 660 $BASE_DIR/implantacion/auditoria-enero.txt

# 7. Archivo parche-seguridad.txt: Solo acceso grupo soporte
chown :$GRUPO_SOPORTE $BASE_DIR/soporte/parche-seguridad.txt
chmod 660 $BASE_DIR/soporte/parche-seguridad.txt

# 8. Archivo documento-jblanco.txt: Solo acceso usuario jblanco
chown $USUARIO_JBLANCO $BASE_DIR/documento-jblanco.txt
chmod 600 $BASE_DIR/documento-jblanco.txt

echo "Permisos y propietarios actualizados correctamente."
