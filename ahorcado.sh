#!/bin/bash

# Función para mostrar el dibujo del ahorcado
mostrar_ahorcado()
{
    case $intentos in
        7) echo "  ____ "
           echo " |    |"
           echo " |"
           echo " |"
           echo " |"
           echo " |"
           echo "_|______"
           ;;
        6) echo "  ____ "
           echo " |    |"
           echo " |    O"
           echo " |"
           echo " |"
           echo " |"
           echo "_|______"
           ;;
        5) echo "  ____ "
           echo " |    |"
           echo " |    O"
           echo " |    |"
           echo " |"
           echo " |"
           echo "_|______"
           ;;
        4) echo "  ____ "
           echo " |    |"
           echo " |    O"
           echo " |   /|"
           echo " |"
           echo " |"
           echo "_|______"
           ;;
        3) echo "  ____ "
           echo " |    |"
           echo " |    O"
           echo " |   /|\\"
           echo " |"
           echo " |"
           echo "_|______"
           ;;
        2) echo "  ____ "
           echo " |    |"
           echo " |    O"
           echo " |   /|\\"
           echo " |   /"
           echo " |"
           echo "_|______"
           ;;
        1) echo "  ____ "
           echo " |    |"
           echo " |    O"
           echo " |   /|\\"
           echo " |   / \\"
           echo " |"
           echo "_|______"
           ;;
        *) echo ""
           echo " |"
           echo " |"
           echo " |"
           echo " |"
           echo "_|______"
           ;;
    esac
}

# Función para mostrar la palabra oculta con letras adivinadas
mostrar_palabra_oculta()
{
    palabra_mostrada=""
    i=1
    while [ $i -le ${#palabra} ]; do
        letra_actual=$(echo "$palabra" | cut -c$i)
        if echo "$adivinadas" | grep -q "$letra_actual"; then
            palabra_mostrada="$palabra_mostrada$letra_actual"
        else
            palabra_mostrada="${palabra_mostrada}_ "
        fi
        i=$((i+1))
    done
    echo "$palabra_mostrada"
}

# Solicitar una palabra al usuario
echo -n "Ingresa una palabra para adivinar: "
read palabra

# Convertir la palabra a minúsculas
palabra=$(echo "$palabra" | tr '[:upper:]' '[:lower:]')

# Verificar si la palabra contiene caracteres que no sean letras
if [[ ! "$palabra" =~ ^[a-zA-Z]+$ ]]; then
    echo "La palabra debe contener solo letras. Inténtalo de nuevo."
    exit 1
fi

# Obtener la longitud de la palabra
longitud_palabra=${#palabra}

# Limpiar pantalla
clear

# Inicializar variables
intentos=7
adivinadas=""
fin_del_juego=0

# Ciclo principal del juego
while [ $fin_del_juego -eq 0 ]; do
    clear
    mostrar_ahorcado
    echo
    echo "Longitud de la palabra: $longitud_palabra"
    echo -e
    echo "Palabra: $(mostrar_palabra_oculta)"

    # Verificar si se ha perdido
    if [ $intentos -eq 0 ]; then
    	echo -e
        echo "¡Perdiste!"
        echo "La palabra era: $palabra"
        fin_del_juego=1
        break
    fi

    # Solicitar una letra al jugador
    echo -e
    echo -n "Ingresa una letra: "
    read letra
    letra=$(echo "$letra" | tr '[:upper:]' '[:lower:]')

    # Verificar si la letra tiene una longitud mayor que 1
    if [ ${#letra} -ne 1 ]; then
    	echo -e
        echo "Por favor, ingresa solo una letra a la vez."
        echo "Presiona enter para continuar..."
        read _
    else
        # Verificar si la letra es una letra válida
        if [[ ! "$letra" =~ ^[a-zA-Z]$ ]]; then
        	echo -e
        	echo "Ingresa solo letras."
            	echo "Presiona enter para continuar..."
            	read _
        else
        # Verificar si la letra ya se adivinó o si ya se ha intentado antes
        letra_ya_adivinada=0
        for letra_adivinada in $(echo $adivinadas | fold -w1); do
        	if [ "$letra_adivinada" = "$letra" ]; then
                	letra_ya_adivinada=1
                	break
            	fi
        done

            if [ $letra_ya_adivinada -eq 1 ]; then
            	echo -e
                echo "Ya adivinaste esa letra o ya la intentaste antes. Intenta con otra."
                echo "Presiona enter para continuar..."
                read _  # Espera a que el usuario presione Enter
            else
                # Verificar si la letra está en la palabra
                if echo "$palabra" | grep -q "$letra"; then
                    adivinadas="$adivinadas$letra"
                else
                    intentos=$((intentos - 1))
                    echo 
                    echo "Letra incorrecta. Te quedan $intentos vidas."
                    echo "Presiona enter para continuar..."
                    read _
                fi

                # Verificar si se ha ganado
                palabra_mostrada=$(mostrar_palabra_oculta)
                if [ "$(echo "$palabra_mostrada" | tr -d ' ')" = "$palabra" ]; then
                    clear
                    mostrar_ahorcado
                    echo "Palabra: $palabra_mostrada"
                    echo -e
                    echo "¡Ganaste!"
                    fin_del_juego=1
                    break
                fi
            fi
        fi
    fi
done


