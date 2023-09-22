#!/bin/bash

intentos=3

while [ $intentos -ge 0 ]; do

	clear
	printf "\n\tIngrese el usuario: "
        read user

	if ! id -u "$user" >/dev/null 2>&1; then
        	printf "\n\tEl usuario no existe"
			read 
			clear
        	intentos=$((intentos-1))
    	else
        	printf "\n\tIngrese la contraseña: "
        	read pass  
        	printf "\nValidando contraseña, espere un momento..\n"

        	# Utiliza el comando 'su' para verificar la contraseña
        	if su -c "true" "$user" <<< "$pass" >/dev/null 2>&1; then
            		printf "\nContraseña correcta, puede ingresar."
					printf "\nPresiona enter para continuar"
					read
					clear
					./ayuda.sh
					./terminal.sh
            		exit 0
        	else
            		printf "\nContraseña incorrecta"
					read 
					clear
            		intentos=$((intentos-1))
        	fi
    	fi
done

printf "\n\tLlegó al límite de intentos, reintente más tarde"
