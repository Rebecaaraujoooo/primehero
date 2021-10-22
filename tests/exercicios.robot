*** Settings ***
Documentation        neste arquivo estarão presentes todos os exercicios de automação do curso Prime Hero

*** Variable ***
# Minha primeira variável do tipo dicionário
&{PESSOA}        
...        nome=Rebeca
...        sobrenome=Araujo
...        idade=21
...        cpf=48476860803
...        profissao=analista de suporte
...        carro=renegade

@{FRUTAS}    Banana    Abacaxi    Limão    Jabuticaba

*** Test Cases ***
Cenario: Imprimindo 6 informações de uma pessoa
    Log to Console    ${PESSOA.nome}
    Log to Console    ${PESSOA.sobrenome}
    Log to Console    ${PESSOA.idade}
    Log to Console    ${PESSOA.cpf}
    Log to Console    ${PESSOA.profissao}
    Log to Console    ${PESSOA.carro}

Cenario: Imprimindo uma lista de frutas 
    [Tags]        LISTA
    Log To Console    ${FRUTAS}
    Log To Console    ${FRUTAS[0]}
    Log To Console    ${FRUTAS[3]}

Centario: Somando dois numeros
    [Tags]                SOMAR
    Somar dois numeros    10    10
    Log To Console        ${RESULTADO}

Cenario: Contando de 0 a 9

    [Tags]    CONTAR
      FOR    ${COUNT}    IN RANGE    0    9
        Log To Console    ${COUNT}
    END
Cenario: Percorrendo lista de frutas    
    [Tags]    FRUTAS
    Percorrer itens de uma lista

Cenario: Criar uma frase
    [Tags]    CRIAR
     Criar uma frase Estou no número de 0 a 10

 Cenario: Imprimir lista de países    
    [Tags]    PAISES
     Imprimir paises  

Cenario: Imprimir frase
    [Tags]    NUMBERS
    Imprimir frase

Cenario: Tomando decisoes
    [Tags]    IF
    Tomar decisoes

*** Keywords ***
Somar dois numeros
    [Arguments]    ${NUM_A}        ${NUM_B}
    ${SOMA}        Evaluate        ${NUM_A}+${NUM_B}
    [Return]       ${SOMA}

Somar os numeros "${NUM_A}" e "${NUM_B}"
    ${SOMA}        Evaluate        ${NUM_A}+${NUM_B}
    [Return]       ${SOMA}

Contar de 0 a 9
    FOR    ${COUNT}    IN RANGE    0    9
        Log To Console    ${COUNT}
    END

Percorrer itens de uma lista
    @{FRUTAS}    Create List    Banana    Abacaxi    Morango
    FOR    ${FRUTA}    IN    @{FRUTAS}
        Log To Console   ${FRUTA}
    END
        
 Imprimir paises
     @{PAISES}    Create List    Brasil    Coreia    Alemanha    EUA    Jamaica
     FOR    ${PAIS}    IN    @{PAISES}
         Log To Console   Estou no País ${PAIS}
     END

Tomar decisoes
    FOR    ${COUNT}    IN RANGE    0    10
        IF     '${COUNT}'=='5'
            Log To Console    Estou no número ${COUNT}
        ELSE IF    '${COUNT}'=='8'
            Log To Console    Estou no número ${COUNT}
        ELSE
            Log To Console    Este não é o número 5 ou 8
        END
    END

