#!/bin/bash

# Se crea un directorio oculto que será utilizado en los ejemplos
mkdir -p /home/vagrant/trincheras-linux/capitulo05/estructura/.directorio-oculto

# Se cambia el propietario del repositorio clonado para no tener problemas de permisos
chown -R vagrant:vagrant /home/vagrant/trincheras-linux

# Ruta base de las carpetas y archivos
BASE_DIR=/home/vagrant/trincheras-linux/capitulo07

# Grupos y usuarios
GRUPO_DESARROLLO="desarrollo"
GRUPO_IMPLANTACION="implantacion"
GRUPO_SOPORTE="soporte"
USUARIO_JBLANCO="jblanco"

# Listas de usuarios por grupo
usuarios_desarrollo=("jblanco" "amartinez" "ilopez" "dalvarez" "icuesta")
usuarios_implantacion=("aperez" "scernadas")
usuarios_soporte=("ebarbosa" "jirago")

# Función para cambiar propietario a los archivos o carpetas de acuerdo al grupo y lista de usuarios
cambiar_propietario() {
    local archivo=$1
    local grupo=$2
    local usuarios=("${!3}") # Pasa la lista de usuarios como una referencia

    # Asignar el propietario al primer usuario del grupo
    propietario="${usuarios[0]}"
    chown $propietario:$grupo $archivo
}

# Cambiar permisos y grupos de las carpetas

# 1. Carpeta comun: Acceso para desarrollo, implantacion y soporte
cambiar_propietario $BASE_DIR/comun $GRUPO_DESARROLLO usuarios_desarrollo[@]
chmod 770 $BASE_DIR/comun

# 2. Carpeta implantacion: Solo acceso grupo implantacion
cambiar_propietario $BASE_DIR/implantacion $GRUPO_IMPLANTACION usuarios_implantacion[@]
chmod 770 $BASE_DIR/implantacion

# 3. Carpeta soporte: Solo acceso grupo soporte
cambiar_propietario $BASE_DIR/soporte $GRUPO_SOPORTE usuarios_soporte[@]
chmod 770 $BASE_DIR/soporte

# 4. Carpeta desarrollo: Solo acceso grupo desarrollo
cambiar_propietario $BASE_DIR/desarrollo $GRUPO_DESARROLLO usuarios_desarrollo[@]
chmod 770 $BASE_DIR/desarrollo

# Cambiar permisos y grupos de los archivos

# 5. Archivos proyecto-android.txt y proyecto-apple.txt: Solo acceso grupo desarrollo
cambiar_propietario $BASE_DIR/proyecto-android.txt $GRUPO_DESARROLLO usuarios_desarrollo[@]
chmod 660 $BASE_DIR/proyecto-android.txt

cambiar_propietario $BASE_DIR/proyecto-apple.txt $GRUPO_DESARROLLO usuarios_desarrollo[@]
chmod 660 $BASE_DIR/proyecto-apple.txt

# 6. Archivo auditoria-enero.txt: Solo acceso grupo implantacion
cambiar_propietario $BASE_DIR/auditoria-enero.txt $GRUPO_IMPLANTACION usuarios_implantacion[@]
chmod 660 $BASE_DIR/auditoria-enero.txt

# 7. Archivo parche-seguridad.txt: Solo acceso grupo soporte
cambiar_propietario $BASE_DIR/parche-seguridad.txt $GRUPO_SOPORTE usuarios_soporte[@]
chmod 660 $BASE_DIR/parche-seguridad.txt

# 8. Archivo documento-jblanco.txt: Solo acceso usuario jblanco
chown $USUARIO_JBLANCO:$GRUPO_DESARROLLO $BASE_DIR/documento-jblanco.txt
chmod 600 $BASE_DIR/documento-jblanco.txt

echo "Permisos y propietarios actualizados correctamente."
