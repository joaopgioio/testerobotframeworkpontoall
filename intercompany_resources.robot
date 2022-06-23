*** Settings ***
Library           Selenium2Library
Library           OperatingSystem


*** Keywords ***

Abrir o navegador
    [Arguments]     ${LOGIN URL}    ${BROWSER}    ${chromedriver}
    Open Browser    ${LOGIN URL}    ${BROWSER}    ${chromedriver}
    Append To Environment Variable      PATH      ./webdriver/chromedriver.exe
    Create Webdriver     Chrome     executable_path=${chromedriver}
    Title Should Be    Intercompany

Inserir Usuario
    [Arguments]     ${username}
    Input Text    user-name    ${username}

Inserir Senha
    [Arguments]     ${password}
    Input Text    user-password    ${password}

Clicar no Botao para login
    Click Button    SendLogin

Validar se o usuario foi logado com sucesso
    Title Should Be    Bem vindo a Intercompany

Fechar o navegador
    Close Browser