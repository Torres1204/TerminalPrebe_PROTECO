#!/bin/bash

fecha_hora=$(TZ="America/Mexico_City" awk 'BEGIN {split(strftime("%d %m %Y %H %M %S"), time); print time[1] "-" time[2] "-" time[3] " " time[4] ":" time[5] ":" time[6]}')

printf "\n"
echo -e "Fecha y hora actual: $fecha_hora \n"







