#!/bin/bash
printf "\nPresiona enter para continuar"
read
clear
printf "\n\n" 
echo -e "Nombre del equipo: $(uname -n)\n"
printf "\t\t\tBienvenido $USER \n"
echo "-----------------------------------------------------------------------------"
echo "    Comando    |         Descripcion "
echo "---------------|-------------------------------------------------------------"
echo "     ayuda     | Muestra los comandos disponibles y su funcionalidad "
echo "     buscar    | Busca un archivo en el sistema "
echo "    creditos   | Muestra los nombres de los desarrolladores "
echo "    infosis    | Muestra información del sistema "
echo "      mp3      | Ejecuta un reproductor de musica "
echo "   fechayhora  | Muestra la fecha y hora "
echo "     juego     | Muestra y ejecuta el juego programado "
echo "     salir     | Sale de la terminal prebe "

