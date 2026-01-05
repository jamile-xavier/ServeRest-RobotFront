*** Settings ***
Resource    ${EXECDIR}/ResourceS/Resource.robot
 
Suite Setup       Abrir o navegador
Test Setup        Cadastro de usuário admin
Suite Teardown    Fechar o navegador

*** Test Cases ***

CT01 - Listar produtos
    Given que estou logado como usuário admin
    When clico em "Listar Produtos"
    Then devo visualizar a lista de produtos cadastrados
    And cada produto listado deve apresentar os campos: "Nome", "Preço", "Descrição", "Quantidade", "Imagem", "Ações"

#  Funcionalidade ainda não habilitada no ServeRest
# CT02 - Editar produto
    # Given que estou logado como usuario admin
    # When clico em "Listar Produtos"
#     And clico no botão editar na frente dos dados do produto
#     Then poderei realizar edição dos dados cadastrados

#  Funcionalidade ainda não habilitada no ServeRest
# CT03 - Excluir produto
    # Given que estou logado como usuário admin
    # When clico em "Listar Produtos"
#     And clico no botão excluir na frente dos dados do produto
#     Then o produto será removido da lista de produtos
