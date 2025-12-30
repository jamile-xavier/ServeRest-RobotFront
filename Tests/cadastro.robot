*** Settings ***
Resource    ../Resources/Resource.robot
Resource    ../Resources/PO/Home.robot
Resource    ../Resources/PO/CadastroUsuario.robot

Library    ../Library/faker_api.py

Test Setup    Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***

CT01 - Cadastro de usuário 
    Home.Given que estou na página inicial
    Home.And clico em "Cadastre-se"
    And preencho o formulário de cadastro
    And clico em "Cadastrar"
    Then o cadastro é concluído

CT02 - Cadastro de usuário administrador
    Given que estou na página inicial
    And clico em "Cadastre-se"
    And preencho o formulário de cadastro
    And seleciono a opção "Cadastrar como administrador"
    And clico em "Cadastrar"
    Then o cadastro é concluído

