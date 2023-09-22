#!/bin/bash

intentos=3

while [ $intentos -ge 0 ]; do

	echo -n "Ingrese el usuario: "
        read user

	if ! id -u "$user" >/dev/null 2>&1; then
        	echo "El usuario no existe"
        	intentos=$((intentos-1))
    	else
        	echo -n "Ingrese la contraseña: "
        	read pass  
        	echo "Validando contraseña, espere un momento.."

        	# Utiliza el comando 'su' para verificar la contraseña
        	if su -c "true" "$user" <<< "$pass" >/dev/null 2>&1; then
            		echo "Contraseña correcta, puede ingresar."
            		echo "meter las funciones"
            		exit 0
        	else
            		echo "Contraseña incorrecta"
            		intentos=$((intentos-1))
        	fi
    	fi
done

echo "Llegó al límite de intentos, reintente más tarde"
