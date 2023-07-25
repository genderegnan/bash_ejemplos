#!/bin/bash
##
sumA=$1
sumB=$2

name=""
canal=""
age=0
year=0

read -p "Ingresa tu nombre: " name
read -p "Igrese canal " canal
read -p "Ingresa tu edad: " age
read -p "Ingresa el año: " year

echo "Operadores Aritmeticos entre $sumA y $sumB"

echo "$sumA + $sumB = " $((sumA + sumB))
echo "$sumA - $sumB = " $((sumA - sumB))
echo "$sumA * $sumB = " $((sumA * sumB))
echo "$sumA / $sumB = " $((sumA / sumB))

echo "Operadores Relacionales entre $sumA y $sumB"

echo "$sumA > $sumB = " $((sumA > sumB))
echo "$sumA < $sumB = " $((sumA < sumB))
echo "$sumA >= $sumB = " $((sumA >= sumB))
echo "$sumA <= $sumB = " $((sumA <= sumB))
echo "$sumA == $sumB = " $((sumA == sumB))
echo "$sumA != $sumB = " $((sumA != sumB))

echo "Operadores de Asignacion entre $sumA y $sumB"

echo "$sumA += $sumB = " $((sumA += sumB))
echo "$sumA -= $sumB = " $((sumA -= sumB))
echo "$sumA *= $sumB = " $((sumA *= sumB))
echo "$sumA /= $sumB = " $((sumA /= sumB))

echo "la cantidad de parametros es $#"
echo "los parametros enviados por el usuario son $*"

echo "Mi nombre es $name y tengo $age años"

if (( $age >= 18 )); then
    echo "Eres mayor"
else
    echo "No eres mayor de edad"
fi

if (( $age >= 18 )) && (( $year == 2023 )); then
    echo "Eres mayor de edad y puedes votar"  
else
    echo "No puedes votar"
fi

if [ "$name"  == "A" ]; then
    echo "Es equal"
fi

case $name in 
    "A") echo "Ha ingresado la opcion A";;
    "B") echo "Ha ingresado la opcion B";;
    [C-Z]) echo "Ha ingresado un valor fuera del rango";;
    *) echo "Por favor solo caracteres de en el rango [A-B]"
esac

numeros=(1 2 3 4 5 6 7 8)
nombres=(alexis martina ezequien lautaro)
rangos=({A..Z} {20..30})

echo "====== Imprimir todos los valores ======="

echo "${numeros[*]}"
echo "${nombres[*]}"
echo "${rangos[*]}"

echo "Contando tamaño de los arreglos"

echo ${#numeros[*]}
echo ${#nombres[*]}
echo ${#rangos[*]}

echo "Imprimir elemento del arreglo por ej ell numero 3"
echo ${numeros[3]}
echo ${nombres[3]}
echo ${rangos[3]}

echo "==== Manipular Arreglos ===="

unset numeros[0]
echo ${numeros[*]}
numeros[0]=1
echo ${numeros[*]}

echo "==== Iterar For ===="

for num in ${numeros[*]}
do 
    echo "Numero: $num"
done

echo "==== Iterar otra forma de hacer el FOR ===="

for (( i=0; i<${#numeros[*]}; i++ ))
do
    echo "Num: ${numeros[i]}"
done

input_type=""
input_name=""
input_text=""
read -p "1 Directorio 2 Archivo " input_type
if (( $input_type == 1 )); then
    read -p "Ingrese nombre de carpeta: " input_name
    mkdir -m 777 $input_name
else
    read -p "Ingrese nombre de archivo: " input_name
    touch $input_name
    read -p "Ingrese texto para el archivo $input_name: " input_text
    echo $input_text >> $input_name
    echo "======= Lectura de Archivos ======"
    echo "IFS Internal Field Separator, para leer linea por linea"

    while IFS= read line
    do 
        echo "$line"
    done < $input_name

fi

echo "======== FUNCIONES ========"

parametros () {
    echo "Hola y $1 y suscribete a $2"
}


parametros $name $canal
