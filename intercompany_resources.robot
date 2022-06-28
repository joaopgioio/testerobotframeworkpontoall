*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem


*** Keywords ***

Abrir o navegador
    [Arguments]     ${LOGIN URL}    ${BROWSER}     ${OPTIONS}    ${filename}
    Open Browser    ${LOGIN URL}    ${BROWSER}     options=${OPTIONS}
    #Append To Environment Variable      PATH      ./webdriver/chromedriver.exe
    Title Should Be    Intercompany
    Capture Page Screenshot    filename=${filename}

Inserir Usuario
    [Arguments]     ${username}
    Input Text    user-name    ${username}
    Capture Page Screenshot 
Inserir Senha
    [Arguments]     ${password}        ${filename}
    Input Text    user-password    ${password}
    Capture Page Screenshot
Clicar no Botao para login
    [Arguments]     ${filename}
    Click Button    SendLogin
Validar se o usuario foi logado com sucesso
    [Arguments]     ${filename}
    Title Should Be    Bem vindo a Intercompany
    Capture Page Screenshot    filename=${filename}
Fechar o navegador
    Close Browser