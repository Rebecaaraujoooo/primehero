*** Settings ***
Documentation            Aqui estarao presentes os primeiros testes automatizados web

Library            SeleniumLibrary


*** Test Cases ***
Caso de Teste 01: Pequisar produto existente
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "Blouse" no campo de Pequisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site