*** Settings ***
Documentation    Aqui estarão presentes os primeiros testes Automatizados web.

Resource    ../Resource/resource/TestAutomation.robot

Test Setup    Abrir navegador
Test Teardown    Fechar navegador

*** Test Cases ***

Caso de Teste 01: Pesquisar produto existente
    [Tags]        CT001
    Acessar a pagina home do site
    Digitar o nome do produto "Blouse" no campo de Pesquisar
    Clicar no botão Pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
    [Tags]        PES01
    Acessar a pagina home do site
    Digitar o nome do produto "ItemNãoExistente" no campo de Pesquisar
    Clicar no botão Pesquisar
    Conferir mensagem de erro "No results were found for your search"produtoNãoExistente""

Caso de Teste 03: Listar Produtos
    [Tags]    LIS01
    Acessar a pagina home do site
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"
    Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página

Caso de Teste 04: Adicionar Cliente
    [Tags]    ADD01
    Acessar a pagina home do site
    Clicar em "Sign in"
    Informar um e-mail válido
    Clicar em "Create an Account"
    Preencher os Dados obrigatório
    Conferir se o cadastro foi efetuado com sucesso