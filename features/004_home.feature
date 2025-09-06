Feature: Home

    Eu, como usuário do ServeRest
    Gostaria de acessar a página home
    Porque desejo visualizar os produtos e interagir com a página (usuário comum) ou gerenciar o sistema (admin)


# Usuário comum
Background: Usuário comum logado
    Given que estou logado como usuario comum
    
Scenario: Pesquisar produtos 
    When clico no campo de Pesquisar produtos e digito o nome do produto 
    And clico no botão Pesquisar
    Then deverá mostrar o produto que pesquisei

Scenario: Adicionar produto a lista (usuario comum)
    When clico em adicionar o produto à lista
    Then o produto deverá ser adicionado à lista redirecionando para a página Lista de Compras

Scenario: Visualizar home usuário comum
    Then deverá aparecer o título "ServeRest Store"
    And deverá aparecer um campo de pesquisa de produtos
    And deverão aparecer cards contendo: Imagem do produto, nome do produto, preço, detalhes e botão "Adicionar a lista"

# Usuário admin

Scenario Outline: Visualizar home do admin
    Given que estou logado como usuário admin
    Then deverá aparecer a mensagem "Bem Vindo <nomeUsuario>. Este é seu sistema para administra seu ecommerce."    
    And deverão aparecer os cards de acesso rápido: Cadastrar Usuários, Listar Usuários, Cadastrar Produtos, Listar Produtos e Relatórios
    
Examples:
    | <nomeUsuario      | 
    | Lucas Gonçalves   | 

Scenario Outline: Clicar em um card do admin
    Given que estou logado como usuário admin
    When clico no card <card>
    Then serei redirecionado para a página "<pagina>"
    
Examples:
    | card                  | página  |       
    | Cadastrar Usuários    | Cadastro de Usuários |
    | Listar Usuários       | Listagem de Usuários |
    | Cadastro de produtos  | Cadastro de Produtos |
    | Listar produtos       | Listagem de Produtos | 
    | Relatórios            | Página de relatórios |
      