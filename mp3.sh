#!/bin/bash

R='\033[1;31m' #Rojo
G='\033[1;32m' # Verde
B='\033[1;34m' # Azul
Y='\033[1;33m' # Amarillo
W='\033[0m' # Blanco
M='\033[1;35m' # Mangenta
reset="\033[0m"

imprimir_logo()
{
	clear
	./logo.sh
}

comprobarmpg123() # Función que comprueba si ya está instalado el reproductor
{ 
	carpetampg123=/bin/mpg123 # Acá se descarga la carpeta

	if [ -f "$carpetampg123" ] # Comprobamos que exista el reporductor
	then
		printf "" # Ya existe
	else
		printf "\n\n\t\t\t$R A D V E R T E N C I A$W \n\n\t\t  No se encuentra instalado 'mpg123' \n"
		printf "\n\t  -------------------------------------------------"
		printf "$Glig\n\n\t\t   ¿Desea instalar mpg123? [s/n]: $W" 
		read opcion
		case $opcion in
			's') # Queremos instalar
				sudo apt install mpg123
				;;
			'n') # No queremos instalar
				exit 0
				;;
			*)
				printf "Opción no valida"
		esac
	fi
}

imprimirMenu()
{
	printf "\n\n\t\t$W  _______________________________"
	printf "\n\n\t\t\t$M      M E N Ú \n\t\t$W  _______________________________\n"
	printf "\n\t\t   1) Reproducir canciones de forma aleatoria (de la carpeta por defecto)"
	printf "\n\t\t   2) Reproducir una canción "
	printf "\n\t\t   3) Salir \n"
	printf "\n\t\t Carpeta por defecto: $Y $HOME/Música$reset"
	printf "\n\t$W  -------------------------------------------------"
}

leerOpcionMenu()
{
	printf "\n\n\t\t    $G¿Qué opción desea?:$W "
	read opcion
}

varias() # Para canciones en lista
{ 
	len=$(ls "${lugarMusica}"/*.mp3 2>/dev/null | wc -l)

    	if [ "$len" -eq 0 ]; then
        	printf "\n\t\t$W _______________________________\n"
        	printf "\n\t\t $G No hay canciones en la carpeta.\n"
        	printf "\t\t $G Intente agregando canciones (archivos .mp3) a la carpeta: "$HOME/Música"\n"
        	printf "\t\t $G Presiona Enter para volver al menú principal."
        	read
        	return
    	fi
	printf "\n\n\t\t\t$B  O P C I O N E S $W"
	printf "\n\t\t _______________________________\n"
	printf "\n\t\t   d) Anterior    f) Siguiente \n"
	printf "\n\t\t\t   s) Pausa/Play\t"
	printf "\n\t\t\t   u) Silenciar\t"
	printf "\n\t\t\t   l) Canción actual\t"
	printf "\n\t\t\t   q) Salir \n"
	printf "\t\t _______________________________\n"
	printf "\n\t       -) Bajar volumen  +) Subir Volumen \n"
	printf "\n\t  -------------------------------------------------"
}

individual() # Para canciones individuales
{ 
	
	printf "\n\n\t\t\t$B  O P C I O N E S $W"
	printf "\n\t\t _______________________________\n"
	printf "\n\t\t\t  s) Pausa/Play\t"
	printf "\n\t\t\t  u) Silenciar\t"
	printf "\n\t\t\t  l) Canción actual\t"
	printf "\n\t\t\t  q) Salir \n"
	printf "\t\t _______________________________\n"
	printf "\n\t       -) Bajar volumen  +) Subir Volumen \n"
	printf "\n\t  -------------------------------------------------"
}


hayCanciones()  # Función para verificar si hay archivos .mp3 en la carpeta
{
    len=$(ls "${lugarMusica}"/*.mp3 2>/dev/null | wc -l)
    if [ "$len" -eq 0 ]; then
        return 1  # No hay canciones
    else
        return 0  # Hay canciones
    fi
}

listarCanciones() # Función para listar canciones
{ 
	listaCacniones=`ls /home/$USER/Música` # Guardamos el contenido de esa carpeta
	printf "\n\n\t    $Y C A N C I O N E S   D I S P O N I B L E S $W"
	printf "\n\t\t _______________________________\n"
	for cancion in ${listaCacniones[*]} 
	do
		printf "\n\t\t- $cancion"
	done
	printf "\n"
	printf "\n\t  -------------------------------------------------"
}

elegirCancionFav() # Función para elegir una cacnión por su nombre
{ 
	#listarCanciones
	printf "\n\n$G Copia y pega el nombre de la cación a reproducir de la lista (sin espacios):$W\n"
	read -p " >>" cancionFav
	#cd .. # Para que no hay problemas en la reproducción
}

main()
{
	trap ' ' INT SIGINT SIGTSTP SIGTERM
	opcion=0
	lugarMusica="$HOME/Música" # Obtenemos la ruta de la música
	imprimir_logo 
	comprobarmpg123
	
	while [ "$opcion" != 4 ]
	do
		clear
		imprimir_logo 
		imprimirMenu 
		leerOpcionMenu 

		case $opcion in
			1)				# Canniones aleatoreas
				clear
				imprimir_logo
				varias
				mpg123 -C --title -q -z "${lugarMusica}"/* 
				;;
			2)				# Canción específica
				clear
				imprimir_logo
				if hayCanciones; then
					listarCanciones
        				elegirCancionFav
    				else
    					printf "\n\t\t$W _______________________________\n"
        				printf "\n\t\t $G No hay canciones en la carpeta.\n"
        				printf "\t\t $G Intente agregando canciones (archivos .mp3) a la carpeta: "$HOME/Música"\n"
        				printf "\t\t $G Presiona Enter para volver al menú principal."
        				read
    				fi
				clear
				imprimir_logo
				individual
				mpg123 -C --title -q -z "${lugarMusica}"/"$cancionFav"
				;;
			3)				# Salir
				clear
				exit 0
				;;
			*)				# Opción no válida
				clear
				imprimir_logo
				imprimirMenu
				printf "\n\n\t\t    $M[Advertencia]$W Opción no válida.\n"
				read 
				;;
		esac
	done
}

main	
