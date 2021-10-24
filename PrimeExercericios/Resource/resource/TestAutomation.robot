*** Settings ***

Library    SeleniumLibrary
Library    Telnet
*** Variables ***

${URL}            http://automationpractice.com
${BROWSER}        Chrome

*** keywords ***

# Caso 01 ################################################################################################
Abrir navegador
        Open Browser    About:Blank    ${BROWSER}


Fechar navegador
        Close Browser


Acessar a pagina home do site
    Go To    ${URL}
    Maximize Browser window
    Title Should Be    My Store


Digitar o nome do produto ${PRODUTO} no campo de Pesquisar

    Input Text    name=search_query    ${PRODUTO}


Clicar no botão Pesquisar

    Click Element        name=submit_search


Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible        xpath=//*[@id="center_column"]//h1//span[1]
    Scroll Element Into View        xpath=//*[@id="center_column"]/ul/li/div/div[2]/div[1]/span
    Title Should Be         Search - My Store
    Page Should Contain Image         xpath=//*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    Capture Page Screenshot



# Caso 02 #########################################################################################
Conferir mensagem de erro "${PRODUTO}"
    Title Should Be    Search - My Store
    Wait Until Element Is Visible    xpath=//p[@class='alert alert-warning']
    Element Should Be Visible    xpath=//p[@class='alert alert-warning']
    Capture Page Screenshot


# Caso 03 ##########################################################################################
Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Wait Until Element Is Visible    xpath=//a[text()='Women']
    Mouse Over    xpath=//a[text()='Women']
    Capture Page Screenshot

Clicar na sub categoria "Summer Dresses"
    Click Link    xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a
    Capture Page Screenshot

Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página
    Wait Until Element Is Visible    xpath=//div[text()='Short dress, long dress, silk dress, printed dress, you will find the perfect dress for summer.']
    Scroll Element Into View    xpath=//*[@id="center_column"]/ul/li[1]/div/div[2]/span/span
    Element Should Be Visible    xpath=//*[@id="center_column"]/ul/li[1]/div/div[2]/h5
    Page Should Contain Image    xpath=//*[@id="center_column"]//img[@src="http://automationpractice.com/img/p/1/2/12-home_default.jpg"]
    Capture Page Screenshot


# Caso 04 ###############################################################
Clicar em "Sign in"
    Wait Until Element Is Visible    xpath=//*[@id="header_logo"]/a/img
    Click Element    xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a

Informar um e-mail válido
    Wait Until Element Is Visible    xpath=//label[@for='email_create'][text()='Email address']
    Input Text    xpath=//*[@id="email_create"]        rebeca.lima.araujo31@gmail.com

Clicar em "Create an Account"
    Click Button    xpath=//*[@id='SubmitCreate']

Preencher os Dados obrigatório
    Wait Until Element Is Visible    xpath=//h1[text()='Create an account']
    Click Element    xpath=//*[@id="id_gender2"]
    Capture Page Screenshot

    Input Text     name=customer_firstname    Rebeca
    Input Text     name=customer_lastname    Araujo
    Input Password    name=passwd    VassouraeRodo

 #--- Inserir Data de Nascimento ----
    Select From List By Value    name=days     31
    Select From List By Value    name=months     3
    Select From List By Value    name=years     2000

    Input Text    name=address1     La Cantera, 323
    Input Text    name=city     San Francisco

    Select From List By Value    name=id_state     32
    Input Text    name=postcode     37493
    Input Text    name=phone_mobile     11982824033

    Capture Page Screenshot
    Click Element                           name=submitAccount
Conferir se o cadastro foi efetuado com sucesso
        Wait Until Element Is Visible           xpath=//*[@id="center_column"]/h1
        Capture Page Screenshot


    
    
    