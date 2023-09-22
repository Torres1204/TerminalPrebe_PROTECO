#!/bin/bash
Glig='\e[1;32m' # Verde claro
reset="\033[0m"

printf "\n $Glig ---INFORMACIÓN DEL SISTEMA---\n $reset"

printf "\t\nNombre del equipo: $(uname -n)\n"

printf "\t\nSistema operativo: $(uname -o)\n"

printf "\t\nVersión del kernel: $(uname -v)\n"

printf "\t\nInformación de la memoria: $(uname -i)\n"

printf "\t\nMemoria RAM: $(free -h)\n"

printf "\t\nArquitectura del sistema: $(uname -m)\n"

printf "\t\nVersion del SO: $(uname -r)\n"

printf "\t\nTipo de procesador: $(uname -p)\n\n"