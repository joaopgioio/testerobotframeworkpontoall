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

*** Test Cases ***
Caso de Teste 1 - Validar Login
    [Documentation]  Esse teste verifica se o usuário foi logado com sucesso
    ...              utilizando o usuário válido joao@gioio.com.br
    [Tags]           login
    Inserir Usuario    ${username}
    Inserir Senha      ${password}
    Clicar no Botao para login
    Validar se o usuario foi logado com sucesso
    # Welcome Page Should Be Open
    # [Teardown]    Close Browser

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