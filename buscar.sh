#!/bin/bash

# Función para buscar el archivo en un directorio
buscar_archivo() 
{
  local directorio="$1"
  local archivo="$2"

  for elemento in "$directorio"/*; do
    if [ -f "$elemento" ] && [ "$(basename "$elemento")" = "$archivo" ]; then
      printf "\nSe encontró el archivo $archivo en $elemento"
      return 0
    elif [ -d "$elemento" ]; then
      buscar_archivo "$elemento" "$archivo"
    fi
  done

  return 1
}

# Solicitar al usuario el directorio y el archivo a buscar
read -p "Por favor, ingrese la ruta absoluta del directorio: " directorio
printf "\n"
read -p "Por favor, ingrese el nombre del archivo a buscar: " archivo

# Verificar si el directorio existe
if [ ! -d "$directorio" ]; then
  printf "\nEl directorio $directorio no existe."
  exit 1
fi

# Llamar a la función para buscar el archivo
if buscar_archivo "$directorio" "$archivo"; then
  exit 0
else
  printf "\nNo se encontró el archivo $archivo en $directorio"
  exit 1
fi





