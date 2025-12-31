*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../ResourceS/Resource.robot
Resource    ../Resources/PO/Login.robot
Resource    ../Resources/PO/Home.robot
 
Suite Setup       Abrir o navegador
Test Setup        Cadastro de usuario
Suite Teardown    Fechar o navegador

*** Variables ***
${TITULO_LISTA_COMPRAS}    //h1[normalize-space()='Lista de Compras']
${PAGINA_LISTA_COMPRAS}    //a[normalize-space()='Lista de Compras']

*** Keywords ***
Given que estou logado como usuário comum
    Realizar Login

When adiciono produtos à lista de compras
    When clico em adicionar o produto à lista
    Then o produto deverá ser adicionado à lista redirecionando para a página Lista de Compras 

And acesso a página Lista de Compras
    Click Element          ${PAGINA_LISTA_COMPRAS}   

Then os itens adicionados deverão aparecer listados na tela
    Wait Until Element Is Visible    ${CARD_PRODUTO} 

*** Test Cases ***

CT01 - Visualizar lista de compras (itens adicionados)
    Given que estou logado como usuário comum
    When adiciono produtos à lista de compras
    And acesso a página Lista de Compras
    Then os itens adicionados deverão aparecer listados na tela


CT02 - Visualizar lista de compras (sem itens adicionados)


# Scenario: Visualizar lista de compras vazia
#     And não adicionei nenhum produto à lista
#     Then deverá aparecer a mensagem "Seu carrinho está vazio"

# Scenario: Voltar para página inicial
#     When clico no botão "Home"
#     Then serei redirecionado para a página home

# Scenario: Adicionar quantidade do produto
#      When clico no ícone "+"
#     Then a quantidade do produto deverá ser incrementada em 1

# Scenario: Remover quantidade do produto
#     When clico no ícone "-"
#     Then a quantidade do produto deverá ser decrementada em 1

# Scenario: Adicionar todos os produtos ao carrinho
#     When clico no botão "Adicionar ao carrinho"
#     Then todos os produtos da lista deverão ser adicionados ao carrinho

# Scenario: Limpar lista de produtos
#     When clico no botão "Limpar Lista"
#     Then todos os produtos da lista deverão ser removidos 
#     And deverá aparecer a mensagem: "Seu carrinho está vazio"