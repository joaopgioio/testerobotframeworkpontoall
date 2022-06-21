*** Settings ***
Library           SeleniumLibrary


*** Keywords ***

Abrir o navegador
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Intercompany

Inserir Usuario
    Input Text    user-name    ${username}

Inserir Senha
    Input Text    user-password    ${password}

Clicar no Botao para login
    Click Button    SendLogin

Validar se o usuario foi logado com sucesso
    Title Should Be    Bem vindo a Intercompany

Fechar o navegador
    Close Browser