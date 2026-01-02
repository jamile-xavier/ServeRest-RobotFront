*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../ResourceS/Resource.robot
Resource    ../Resources/PO/Login.robot
Resource    ../Resources/PO/Home.robot
Resource    ../Resources/PO/ListaUsuarios.robot
Resource    ../Resources/PO/CadastroUsuario.robot

Suite Setup       Abrir o navegador
Test Setup        Cadastro de usuario admin
Suite Teardown    Fechar o navegador

*** Test Cases ***

CT01 - Listar usuários
    Given que estou logado como usuario admin
    When clico em "Listar Usuários"
    Then serei redirecionada para página Lista dos usuários

CT02 - Visualizar as informações do usuário
    Given que estou logado como usuario admin
    When clico em "Listar Usuários"
    Then cada usuário listado deve apresentar os campos: "Nome", "Email", "Senha", "Administrador", "Ações"

# Ainda não disponível as ações abaixo
# CT03 - Editar usuário

# CT04 - Excluir usuário
