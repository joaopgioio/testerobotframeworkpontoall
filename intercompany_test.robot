*** Settings ***
Documentation     Esse é o teste para o site da intercompany
Resource          intercompany_resources.robot
Test Setup        Abrir o navegador    ${LOGIN URL}     ${BROWSER}     ${OPTIONS}    ${filename}
Test Teardown     Fechar o navegador




*** Variables ***
#${LOGIN URL}      http://localhost:3000/intercompany/index.php
${LOGIN URL}       https://intercompany.herokuapp.com/index.php
${BROWSER}         chrome
#${NAVEGADOR_CHROMEHEADLESS}     headlesschrome
### Opções necessárias para rodar headless no Linux do CI (runner)
${OPTIONS}      add_argument("--disable-dev-shm-usage"); add_argument("--headless"); add_argument("--no-sandbox")
#${chromedriver}    executable_path=./webdriver/chromedriver.exe       
${username}        joao@gioio.com.br
${password}        123
${filename}        selenium-screenshot-{index}.png
${full_name}       João Paulo Alves
${unidade}         Tanabi
${cep}             15170970
${logradouro}      Rua Barão do Rio Branco
${numero}          331
${complemento}     Lote B
${bairro}          Centro     
${cidade}          Tanabi
${estado}          SP

*** Test Cases ***
Caso de Teste 1 - Validar Login
    [Documentation]  Esse teste verifica se o usuário foi logado com sucesso
    ...              utilizando o usuário válido joao@gioio.com.br
    [Tags]           login
    Inserir Usuario    ${username}        ${filename}
    Inserir Senha      ${password}        ${filename}
    Clicar no Botao para login        ${filename}
    Validar se o usuario foi logado com sucesso        ${filename}    ${full_name} 
    # Welcome Page Should Be Open
    # [Teardown]    Close Browser

Caso de Teste 2 - Consultar unidades
    [Documentation]  Esse teste faz a consulta de unidades
    ...              utilizando o usuário logado válido joao@gioio.com.br
    [Tags]           consulta unidade
    Inserir Usuario    ${username}      ${filename}
    Inserir Senha      ${password}      ${filename}
    Clicar no Botao para login          ${filename}
    Clicar em listar unidade    ${filename} 
    No campo de pesquisa inserir a unidade de Tanabi    ${unidade}    ${filename} 
    Validar se os valores retornados    ${unidade}    ${cep}    ${logradouro}    ${numero}    ${complemento}    ${bairro}    ${cidade}    ${estado}        ${filename}   


# Inserir Usuario
#     [Arguments]    ${username}
#     Input Text    username_field    ${username}

# Input Password
#     [Arguments]    ${password}
#     Input Text    password_field    ${password}

# Submit Credentials
#     Click Button    login_button

# Welcome Page Should Be Open
#     Title Should Be    Welcome Page