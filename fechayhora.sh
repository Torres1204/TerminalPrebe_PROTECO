#!/bin/bash

fecha_hora=$(TZ="America/Mexico_City" awk 'BEGIN {split(strftime("%d %m %Y %H %M %S"), time); print time[1] "-" time[2] "-" time[3] " " time[4] ":" time[5] ":" time[6]}')

echo "Fecha y hora actual: $fecha_hora"







