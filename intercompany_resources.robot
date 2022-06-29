*** Settings ***
#Library           SeleniumLibrary
Library           Selenium2Library
Library           OperatingSystem


*** Keywords ***

Abrir o navegador
    [Arguments]     ${LOGIN URL}    ${BROWSER}     ${OPTIONS}    ${filename}
    Open Browser    ${LOGIN URL}    ${BROWSER}     options=${OPTIONS}
    #Append To Environment Variable      PATH      ./webdriver/chromedriver.exe
    Title Should Be    Intercompany
    Capture Page Screenshot    filename=${filename}

Inserir Usuario
    [Arguments]     ${username}        ${filename}
    Input Text    user-name    ${username}
    Capture Page Screenshot     ${filename}
Inserir Senha
    [Arguments]     ${password}        ${filename}
    Input Text    user-password    ${password}
    Capture Page Screenshot        ${filename}
Clicar no Botao para login
    [Arguments]     ${filename}
    Click Button    SendLogin
    Capture Page Screenshot    filename=${filename}
Validar se o usuario foi logado com sucesso
    [Arguments]                ${filename}    ${full_name}
    Title Should Be            Bem vindo a Intercompany                 
    Wait Until Page Contains Element     class=user-name
    Wait Until Page Contains Element     class=user-status
    Page Should Contain        Online
    Page Should Contain        ${full_name}
    Page Should Contain        Você acabou de acessar o novo sistema 
    Capture Page Screenshot    filename=${filename}
Fechar o navegador
    Close Browser