#!/bin/bash

count=1
phrase="Nothing to say!"

# Função de Ajuda e descritiva
function description {
    echo "Repetidor de frases: "
    echo ""
    echo "Uso :$(basename "$0") --count <numero> --phrase <texto>"
    echo ""
    echo " --count <numero> : numero de vezes que a frase vai se repetir"
    echo "--phrase <texto> : frase a ser repetida"
    echo "--help : Mostra essa mensagem de ajuda"
}
# Função auxiliar para repetir a frase
function repeater {
    local total=${1:-1} # Primeiro argumento é o total de repetições, por padrão 1
    local i=0 #iterador

    while (($i < $total)); do
        echo "${2:-Nada a repetir}" #Segundo argumento é a frase a ser repetida.
        ((i++)) #((i=i+1))
    done
}

#Main
while (( $# > 0 )); do
# $# é um wildcard para tratar todas as entradas.
# Traduzindo. Enquanto a quantidade de entradas for maior que zero; faça:


    case "$1" in # Caso o primeiro argumento esteja em --count|-c
        --count|-c)
            count="$2" # A variável count será a segunda entrada $2
            shift 2 # Move para o próximo par de entradas
            ;; # Encerra a condição case

        --phrase|-p) # O mesmo, mas agora a primeira váriavel do par é --phrase
            phrase="$2" # A váriavel phrase será a segunda entrada do par
            shift 2 # Move para o próximo apr
            ;;

        --help|-h) # Comando de ajuda
            description #Função de ajuda
            exit 0 #Saída com valor 0 indicando que não foi uma chamada com erro
            ;;
        *) # Caso receba qualquer coisa diferente das condições estabelecidas
            echo "comando inválido '$1'"
            echo "Use --help para ver os comandos"
            exit 1 # Saída com erro
            ;;
    esac
done

# Valida se count é um valor numérico

#Revisar Regex
if ! [[ "$count" =~ ^[0-9]+$ ]]; then
    echo "Erro: '--count' precisa ser um número inteiro."
    exit 1
fi

repeater "$count" "$phrase" #Chamada da função auxiliar
