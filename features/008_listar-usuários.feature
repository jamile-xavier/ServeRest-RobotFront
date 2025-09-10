Feature: Listar usuários
    Eu, como usuário administrador do ServeRest
    Gostaria de acessar a página listar usuários
    Porque desejo visualizar e editar os dados de usuários

Background: Usuário admin logado
    Given que estou logado como usuário admin
    And me encontro na página Listar Usuários

Scenario: Visualizar as informações do usuário
    When visualizo o título "Lista dos usuários"
    Then devo visualizar a lista de usuários cadastrados
    And cada usuário listado deve apresentar os campos: "Nome", "Email", "Senha", "Administrador", "Ações"

# Funcionalidade ainda não habilitada no ServeRest
Scenario: Editar usuários
    When clico no botão editar na frente dos dados do usuário
    Then poderei realizar edição dos dados cadastrados

Scenario: Excluir usuários
    When clico no botão excluir na frente dos dados do usuário
    Then o usuário será removido da lista de usuários