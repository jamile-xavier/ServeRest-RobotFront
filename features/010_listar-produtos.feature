Feature: Listar produtos
    Eu, como usuário administrador do ServeRest
    Gostaria de acessar a página listar produtos
    Porque desejo visualizar e editar os dados dos produtos

Background: Usuário admin logado
    Given que estou logado como usuário admin
    And me encontro na página Listar Produtos

Scenario: Visualizar as informações do produto
    When visualizo o título "Lista dos Produtos"
    Then devo visualizar a lista de produtos cadastrados
    And cada produto listado deve apresentar os campos: "Nome", "Preço", "Descrição", "Quantidade", "Imagem", "Ações"

# Funcionalidade ainda não habilitada no ServeRest
Scenario: Editar produto
    When clico no botão editar na frente dos dados do produto
    Then poderei realizar edição dos dados cadastrados

# Funcionalidade ainda não habilitada no ServeRest
Scenario: Excluir produto
    When clico no botão excluir na frente dos dados do produto
    Then o produto será removido da lista de produtos