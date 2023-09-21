#!/bin/bash
intentos=3
#funcion para validar datos del usuario
validar(){
	local user="$1"
	local pass="$2"
	local passEncriptada=$(sudo grep "^$user:" /etc/shadow | cut -d: -f2)
	if [ -n "$passEncriptada" ]; then
		if sudo sh -c "echo '$pass' | openssl passwd -6 -stdin -salt $(echo $passEncriptada | cut -d\$ -f3) -check $passEncriptada" &>/dev/null; then
			return 0 #La contraseña esta bien y accede
		fi
	fi
	return 1 #La contraseña esta mal
}

while [ $intentos -ge 0 ]; do
	echo "Ingrese el usuario: "
	read user
	echo "Ingrese la contraseña: "
	read pass
	if validar "$user" "$pass"; then
		intentos=0
	else
		if [ $intentos -gt 0 ]; then
			echo "No se pudo acceder, intente de nuevo"
		else
			echo "Llego al limite de intentos"
			exit 1
		fi
	fi
	intentos=$((intentos-1))
done
echo -e "------------------------------------------------------------\n-"
echo -e "                     Bienvenido $user\n"
echo -e "-------------------------------------------------------------\n"
        
        
    