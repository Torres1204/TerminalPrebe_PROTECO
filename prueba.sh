#!/bin/bash
    
    echo "----- Bienvenido -----"
    CONT=3
    
    while [ $CONT -ge 0 ]
    do
        echo "Ingrese su usuario: "
        read nomUsuario

        echo "Ingrese su contraseña: "
        read Contra
        echo $Contra | su $nomUsuario -c sh prueba.sh; 

        
        #Si el comando falla vuelve  a preguntar, si no ya se va al menú
    done

        
        
    