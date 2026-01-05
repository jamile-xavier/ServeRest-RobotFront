*** Settings ***
Resource    ${EXECDIR}/ResourceS/Resource.robot
 
Suite Setup       Abrir o navegador
Test Setup        Cadastro de usuário
Suite Teardown    Fechar o navegador

*** Test Cases ***

CT01 - Visualizar lista de compras 
    Given que estou logado como usuário comum
    When adiciono produtos à lista de compras
    And acesso a página Lista de Compras
    Then os itens adicionados deverão aparecer listados na tela


CT02 - Adicionar quantidade do produto
    Given que estou logado como usuário comum
    When adiciono produtos à lista de compras
    And capturo a quantidade atual do produto
    And clico no ícone "+"
    Then a quantidade do produto deverá ser incrementada em 1

CT03 - Remover quantidade do produto
    Given que estou logado como usuário comum
    When adiciono produtos à lista de compras
    And capturo a quantidade atual do produto
    And clico no ícone "-"
    Then a quantidade do produto deverá ser decrementada em 1

# Página de carrinho ainda em construção
# CT04 - Adicionar os produtos ao carrinho
#     Given que estou logado como usuário comum
#     When adiciono produtos à lista de compras
#     And clico no botão "Adicionar ao carrinho"
#     Then todos os produtos da lista deverão ser adicionados ao carrinho

CT05 - Limpar lista de produtos
    Given que estou logado como usuário comum
    When adiciono produtos à lista de compras
    And clico no botão "Limpar Lista"
    Then todos os produtos da lista deverão ser removidos 
