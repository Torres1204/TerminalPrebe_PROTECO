#!/bin/bash
#!/bin/bash
trap ' ' INT
stty susp ^0 #ignora Ctrl+bandera
mostrar=$(pwd)
listaComandos=("ayuda","buscar","creditos","infosis","mp3","fechayhora","juego","salir")
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
        #./mp3.sh
        opcion=""
    fi
    if [ "$opcion" == "fechayhora" ]; then
        ./fechayhora.sh
        opcion=""
    fi
    if [ "$opcion" == "juego" ]; then
        #./juego.sh
        opcion=""
    fi

    if [ "$opcion" == "salir" ]; then
        opcion=""
        exit 1
    fi
    $opcion
done



