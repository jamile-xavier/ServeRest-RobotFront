*** Settings ***
Resource    ${EXECDIR}/Resources/Resource.robot

Suite Setup       Abrir o navegador
Test Setup        Cadastro de usuário
Suite Teardown    Fechar o navegador

*** Test Cases ***
CT01 - Realizar logout
    Given que estou logado na ServeRest
    When clico no botão logout
    Then o logout deverá ser realizado redirecionando para página de login
