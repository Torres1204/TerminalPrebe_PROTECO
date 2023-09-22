#!/bin/bash
exit(){
    printf "\n comando invalido\n"
}
trap ' ' INT SIGINT SIGTSTP SIGTERM
stty susp ^0 #ignora Ctrl+bandera
opcion=""

while true; do
    ruta="$(pwd)"
    printf "$USER"":~""$ruta""$ "
    read opcion

    if [ "$opcion" == "ayuda" ]; then
        ./ayuda.sh
        opcion=""
        #break
    fi
    if [ "$opcion" == "buscar" ]; then
        ./buscar.sh
        opcion=""
    fi
    if [ "$opcion" == "creditos" ]; then
        ./creditos.sh
        opcion=""
    fi
    if [ "$opcion" == "infosis" ]; then
        ./infosis.sh
        opcion=""
    fi
    if [ "$opcion" == "mp3" ]; then
        ./mp3.sh
        opcion=""
    fi
    if [ "$opcion" == "fechayhora" ]; then
        ./fechayhora.sh
        opcion=""
    fi
    if [ "$opcion" == "juego" ]; then
        ./juego.sh
        opcion=""
    fi

    if [ "$opcion" == "salir" ]; then
        opcion=""
        break
    fi
    $opcion
done



