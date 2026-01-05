*** Settings ***
Resource    ${EXECDIR}/ResourceS/Resource.robot

Suite Setup       Abrir o navegador
Test Setup        Cadastro de usuário admin
Suite Teardown    Fechar o navegador


*** Test Cases ***

CT01 - Cadastro de produto com sucesso
    Given que estou logado como usuário admin
    When clico em "Cadastrar Produtos"
    And preencho o formulário de cadastro de produtos com dados válidos 
    And clico no botão "Cadastrar"
    Then o produto deverá ser cadastrado com sucesso redirecionando para página "Lista de Produtos"

CT02 - Cadastro de produto com todos os campos em branco
    Given que estou logado como usuário admin
    When clico em "Cadastrar Produtos"
    And não preencho os campos do formulário de produto    
    And clico no botão "Cadastrar"
    Then aparecerá a mensagem de erro: "Nome é obrigatório"
    And aparecerá a mensagem de erro: "Preco é obrigatório"
    And aparecerá a mensagem de erro: "Descricao é obrigatório"
    And aparecerá a mensagem de erro: "Quantidade é obrigatório"

CT03 - Cadastro de produto em duplicidade
    Given que estou logado como usuário admin
    When clico em "Cadastrar Produtos"
    And preencho o formulário de cadastro com um produto já existente
    And clico no botão "Cadastrar"
    Then deverá aparecer a mensagem "Já existe produto com esse nome"


CT04 - Cadastro de produto com preço negativo
    Given que estou logado como usuário admin
    When clico em "Cadastrar Produtos"
    And preencho o formulário de cadastro de produto informando um preço negativo
    And clico no botão "Cadastrar"
    Then deverá aparecer a mensagem "Preco deve ser um número positivo"

CT05 - Cadastro de produto com quantidade negativa
    Given que estou logado como usuário admin
    When clico em "Cadastrar Produtos"
    And preencho o formulário de cadastro de produto informando a quantidade negativa
    And clico no botão "Cadastrar"
    Then deverá aparecer a mensagem "Quantidade deve ser maior ou igual a 0"

