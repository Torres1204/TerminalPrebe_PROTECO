#!/bin/bash

echo "---INFORMACIÓN DEL SISTEMA---"

echo -e "Nombre del equipo: $(uname -n)\n"

echo -e "Sistema operativo: $(uname -o)\n"

echo -e "Versión del kernel: $(uname -v)\n"

echo -e "Información de la memoria: $(uname -i)\n"

echo -e "Memoria RAM: $(free -h)\n"

echo -e "Arquitectura del sistema: $(uname -m)\n"

echo -e "Version del SO: $(uname -r)\n"

echo -e "Tipo de procesador: $(uname -p)\n"