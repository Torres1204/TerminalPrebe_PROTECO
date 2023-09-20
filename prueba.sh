#!/bin/bash
    ##usuario=$USER #ahi se guarda el usuario que está en el sistema, y con el que se va a comparar
    contrasena=aaa #contraseña desencriptada
    
    echo "----- Bienvenido -----"
    CONT=3
    
    while [ $CONT -ge 0 ]
    do
        echo "Ingrese su usuario: "
        read nomUsuario

        echo "Ingrese su contraseña: "
        read Contra
        echo $contra | su $nomUsuario -c sh prueba.sh; 

        
        #Si el comando falla vuelve  a preguntar, si no ya se va al menú
    done

        
        
    