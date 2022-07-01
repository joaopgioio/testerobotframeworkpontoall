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
Validar se o usuario foi logado com sucesso
    [Arguments]                ${filename}    ${full_name}
    Title Should Be            Bem vindo a Intercompany                 
    Wait Until Page Contains Element     class=user-name      10
    Wait Until Page Contains Element     class=user-status    10
    Sleep                      10
    Page Should Contain        Online
    Page Should Contain        ${full_name}
    Page Should Contain        Você acabou de acessar o novo sistema 
    Wait Until Page Contains Element    class=search-input-icon
    Capture Page Screenshot    filename=${filename}

Clicar em listar unidade
    [Arguments]    ${filename}
    Click Button    id=listar-unidades
No campo de pesquisa inserir a unidade de Tanabi
    [Arguments]    ${unidade}    ${filename} 
    Wait Until Page Contains Element    //input[@type="search"]
    Input Text     //input[@type="search"]     ${unidade}   
    Capture Page Screenshot    filename=${filename}
Validar se os valores retornados
    [Arguments]       ${unidade}    ${cep}    ${logradouro}    ${numero}    ${complemento}    ${bairro}    ${cidade}   ${estado}    ${filename}
    #Table Cell Should Contain   //*[@class="table zero-configuration dataTable"]/tbody   1    1    ${unidade}
    Sleep        15
    Wait Until Page Contains Element     //*[@class="table zero-configuration dataTable"]/tbody 
    Table Should Contain       //*[@class="table zero-configuration dataTable"]/tbody/tr   ${unidade}
    Table Should Contain       //*[@class="table zero-configuration dataTable"]/tbody    ${cep}
    Table Should Contain       //*[@class="table zero-configuration dataTable"]/tbody    ${logradouro}
    Table Should Contain       //*[@class="table zero-configuration dataTable"]/tbody    ${numero}
    Table Should Contain       //*[@class="table zero-configuration dataTable"]/tbody    ${complemento}
    Table Should Contain       //*[@class="table zero-configuration dataTable"]/tbody    ${bairro}
    Table Should Contain       //*[@class="table zero-configuration dataTable"]/tbody    ${cidade}
    Table Should Contain       //*[@class="table zero-configuration dataTable"]/tbody    ${estado}
    Capture Page Screenshot    filename=${filename}
Fechar o navegador
    Close Browser