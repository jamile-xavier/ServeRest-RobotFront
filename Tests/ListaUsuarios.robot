*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../ResourceS/Resource.robot
Resource    ../Resources/PO/Login.robot
Resource    ../Resources/PO/Home.robot

Suite Setup       Abrir o navegador
Test Setup        Cadastro de usuario admin
Suite Teardown    Fechar o navegador

*** Test Cases ***

CT01 - Listar usuários
    Given que estou logado como usuario admin
    When clico em "Listar Usuários"
    Then serei redirecionada para página Lista dos usuários

*** Variables ***
${LINK_LISTAR_USUARIOS}     //a[normalize-space()='Listar Usuários']
${TABELA_LISTA_USUARIOS}    //div[@class='jumbotron']
${TITULO_TABELA_LISTA_USUARIOS}    Lista dos usuários

*** Keywords ***
When clico em "Listar Usuários"
    Click Element    ${LINK_LISTAR_USUARIOS} 

Then serei redirecionada para página Lista dos usuários
    Wait Until Element Is Visible    ${TABELA_LISTA_USUARIOS}
    Title Should Be    ${TITULO_TABELA_LISTA_USUARIOS}
# Background: Usuário admin logado
#     Given que estou logado como usuário admin
#     And me encontro na página Listar Usuários

# Scenario: Visualizar as informações do usuário
#     When visualizo o título "Lista dos usuários"
#     Then devo visualizar a lista de usuários cadastrados
#     And cada usuário listado deve apresentar os campos: "Nome", "Email", "Senha", "Administrador", "Ações"

# # Funcionalidade ainda não habilitada no ServeRest
# Scenario: Editar usuários
#     When clico no botão editar na frente dos dados do usuário
#     Then poderei realizar edição dos dados cadastrados

# Scenario: Excluir usuários
#     When clico no botão excluir na frente dos dados do usuário
#     Then o usuário será removido da lista de usuários