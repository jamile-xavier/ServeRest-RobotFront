Feature: Cadastrar produtos

Background: Usuário admin logado
    Given que estou logado como usuário admin
    And me encontro na página Cadastrar Produtos

Scenario:  Cadastro de produto com sucesso
    When preencho o formulário de cadastro de produtos com dados válidos 
    And clico no botão "Cadastrar"
    Then o produto deverá ser cadastrado com sucesso
    And a página será redirecionada para "Lista de Produtos"

Scenario: Cadastro de produto com todos os campos em branco
    When deixo todos os campos do formulário em branco 
    And clico no botão "Cadastrar"
    Then aparecerá a mensagem de erro: "Nome é obrigatório"
    And aparecerá a mensagem de erro: "Preco é obrigatório"
    And aparecerá a mensagem de erro: "Descricao é obrigatório"
    And aparecerá a mensagem de erro: "Quantidade é obrigatório"
    And o produto não será cadastrado

Scenario: Cadastro de produto em duplicidade
    When digito o nome de um produto já existente
    And clico no botão "Cadastrar"
    Then deverá aparecer a mensagem "Já existe produto com esse nome"
    And o produto não será cadastrado

Scenario: Cadastro de produto com preço negativo
    When preencho o formulário de cadastro de produto informando um preço negativo
    And clico no botão "Cadastrar"
    Then deverá aparecer a mensagem "Preco deve ser um número positivo"
    And o produto não será cadastrado

Scenario: Cadastro de produto com quantidade negativa
    When preencho o formulário de cadastro de produto informando a quantidade negativa
    And clico no botão "Cadastrar"
    Then deverá aparecer a mensagem "Quantidade deve ser maior ou igual a 0"
    And o produto não será cadastrado
