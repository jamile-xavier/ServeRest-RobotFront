*** Settings ***
Resource    ../Resources/Resource.robot
Resource    ../Resources/PO/Home.robot
Resource    ../Resources/PO/CadastroUsuario.robot

Suite Setup       Abrir o navegador
Test Setup        Cadastro de usuario
Suite Teardown    Fechar o navegador

*** Test Cases ***
CT01 - Login com sucesso
    Realizar Login

CT02 - Login com e-mail em branco
    Given que estou na página inicial
    When que preencho o formulário de login com e-mail em branco 
    And clico no botão "ENTRAR"
    Then apresenta a mensagem "Email é obrigatório"   

CT03 - Login com senha em branco
    Given que estou na página inicial
    When que preencho o formulário de login com senha em branco 
    And clico no botão "ENTRAR"
    Then apresenta a mensagem "Password não pode ficar em branco"  

CT04 - Login com e-mail inválido
    Given que estou na página inicial
    When que preencho o formulário de login com e-mail inválido 
    And clico no botão "ENTRAR"
    Then apresenta a mensagem "Email e/ou senha inválidos"   

CT05 - Login com senha inválida
    Given que estou na página inicial
    When que preencho o formulário de login com senha inválida 
    And clico no botão "ENTRAR"
    Then apresenta a mensagem "Email e/ou senha inválidos"    

