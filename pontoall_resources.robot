*** Settings ***
#Library           SeleniumLibrary
Library           Selenium2Library
Library           OperatingSystem


*** Keywords ***

Abrir o navegador
    [Arguments]     ${LOGIN URL}    ${BROWSER}     ${OPTIONS}    ${filename}
    Open Browser    ${LOGIN URL}    ${BROWSER}     options=${OPTIONS}
    #Append To Environment Variable      PATH      ./106/chromedriver.exe
    Title Should Be    PontoAll - Registro de Ponto
    Capture Page Screenshot    filename=${filename}

Clicar no Botao para cadastrar professor
    [Arguments]        ${filename}
    Title Should Be    PontoAll - Registro de Ponto
    Click Link        link=Sistema
    Click Link        link=Cadastrar Professor
    Capture Page Screenshot    filename=${filename}

Inserir Nome
    [Arguments]     ${nome}        ${filename}
    Input Text    nome    ${nome}
    Capture Page Screenshot     ${filename}

Inserir Matricula
    [Arguments]     ${matricula}        ${filename}
    Input Text    matricula    ${matricula}
    Capture Page Screenshot     ${filename}

Inserir Materia
    [Arguments]     ${materia}        ${filename}
    Select From List By Value    materia   ${materia}
    Capture Page Screenshot     ${filename}

Inserir Senha
    [Arguments]     ${password}        ${filename}
    Input Text    password    ${password}
    Capture Page Screenshot        ${filename}

Clicar no Botao para Salvar
    [Arguments]     ${filename}
    Click Button        salvar
    sleep     5
    Capture Page Screenshot        ${filename}

Clicar no Botao para pesquisar professor
    [Arguments]        ${filename}
    Title Should Be    PontoAll - Registro de Ponto
    Click Link        link=Sistema
    Click Link        link=Professores
    Capture Page Screenshot    filename=${filename}

Validar Cadastro Professor    
    [Arguments]    ${nome}    ${matricula}    ${materia}     ${filename}
    Page Should Contain    Professores
    sleep     5
    Wait Until Page Contains Element     //*[@class="table table-striped table-bordered table-hover"]/tbody
    Table Should Contain       //*[@class="table table-striped table-bordered table-hover"]/tbody   ${nome}
    Table Should Contain       //*[@class="table table-striped table-bordered table-hover"]/tbody   ${materia}
    Table Should Contain       //*[@class="table table-striped table-bordered table-hover"]/tbody   ${matricula}
    Capture Page Screenshot    filename=${filename}

Fechar o navegador
    Close Browser