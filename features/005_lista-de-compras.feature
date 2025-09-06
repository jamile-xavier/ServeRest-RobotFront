Feature: Lista de Compras
  
    Eu, como usuário do ServeRest
    Gostaria de gerenciar minha lista de compras
    Porque gostaria de visualizar, adicionar ou remover produtos antes de finalizar a compra

Background: Usuário comum logado
    Given que estou logado como usuário comum
    And me encontro na página Lista de Compras

Scenario: Visualizar lista de compras com itens
    And adicionei produtos à lista
    Then os itens adicionados deverão aparecer listados na tela

Scenario: Visualizar lista de compras vazia
    And não adicionei nenhum produto à lista
    Then deverá aparecer a mensagem "Seu carrinho está vazio"

Scenario: Voltar para página inicial
     When clico no botão "Home"
    Then serei redirecionado para a página home

Scenario: Adicionar quantidade do produto
     When clico no ícone "+"
    Then a quantidade do produto deverá ser incrementada em 1

Scenario: Remover quantidade do produto
    When clico no ícone "-"
    Then a quantidade do produto deverá ser decrementada em 1

Scenario: Adicionar todos os produtos ao carrinho
    When clico no botão "Adicionar ao carrinho"
    Then todos os produtos da lista deverão ser adicionados ao carrinho

Scenario: Limpar lista de produtos
    When clico no botão "Limpar Lista"
    Then todos os produtos da lista deverão ser removidos 
    And deverá aparecer a mensagem: "Seu carrinho está vazio"