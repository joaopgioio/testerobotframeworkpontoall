*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem


*** Keywords ***

Abrir o navegador
    [Arguments]     ${LOGIN URL}    ${BROWSER}     ${OPTIONS}
    Open Browser    ${LOGIN URL}    ${BROWSER}     options=${OPTIONS}${OPTIONS}
    #Append To Environment Variable      PATH      ./webdriver/chromedriver.exe
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