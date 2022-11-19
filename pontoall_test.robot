*** Settings ***
Documentation     Esse é o teste para o site da PontoAll
Resource          pontoall_resources.robot
Test Setup        Abrir o navegador    ${LOGIN URL}     ${BROWSER}    ${OPTIONS}    ${filename}
Test Teardown     Fechar o navegador




*** Variables ***
#${LOGIN URL}      http://localhost:3000/intercompany/index.php
${LOGIN URL}       https://pontoall-front.vercel.app/
${BROWSER}         chrome
#${NAVEGADOR_CHROMEHEADLESS}     headlesschrome
### Opções necessárias para rodar headless no Linux do CI (runner)
${OPTIONS}      add_argument("--disable-dev-shm-usage"); add_argument("--headless"); add_argument("--no-sandbox")
#${chromedriver}    executable_path=./106/chromedriver.exe  
${nome}            Brasil
${matricula}       1234
${materia}        artes
${password}        123
${filename}        selenium-screenshot-{index}.png

*** Test Cases ***
Caso de Teste 1 - Cadastro de Professor
    [Documentation]  Esse teste efetua o cadastro do professor
    ...              informando alguns dados
    [Tags]           Cadastro Professor
    Clicar no Botao para cadastrar professor    ${filename}
    Inserir Nome    ${nome}        ${filename}
    Inserir Matricula    ${matricula}        ${filename}
    Inserir Materia    ${materia}        ${filename}
    Inserir Senha    ${password}        ${filename}
    Clicar no Botao para Salvar    ${filename}

Caso de Teste 2 - Validar cadastro de Professor
    [Documentation]  Esse teste valida o cadastro do professor
    [Tags]           Validar Cadastro Professor
    Clicar no Botao para pesquisar professor    ${filename}
    Validar Cadastro Professor    ${nome}    ${matricula}    ${materia}     ${filename}