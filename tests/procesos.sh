#!/bin/bash

# Función para calcular el número de Fibonacci con índice $1
fibonacci() {
  local n=$1
  local a=0
  local b=1
  for ((i=0; i<n; i++)); do
    local c=$((a + b))
    a=$b
    b=$c
  done
  echo $a
}

# Crear 100 procesos concurrentes
for ((i=1;i<=1000;i++)); do
  # Ejecutar cada proceso en segundo plano
  (
    # Mostrar el número de proceso y el resultado de calcular el fibonacci con índice 40
    echo "Proceso $i: $(fibonacci 5000)"
  ) &
done

# Esperar a que todos los procesos hijos terminen
wait

