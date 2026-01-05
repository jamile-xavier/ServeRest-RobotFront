*** Settings ***
Resource    ${EXECDIR}/Resources/Resource.robot

Suite Setup       Abrir o navegador
Test Setup        Cadastro de usuário
Suite Teardown    Fechar o navegador

*** Test Cases ***
CT01 - Pesquisa de produtos (usuário não admin)
    Given que estou logado como usuário comum
    When clico no campo de Pesquisar produtos e digito o nome do produto "Logitech MX Vertical" 
    And clico no botão Pesquisar
    Then deverá mostrar o produto que pesquisei


CT02 - Adicionar produto a lista (usuário não admin)
    Given que estou logado como usuário comum
    When clico em adicionar o produto à lista
    Then o produto deverá ser adicionado à lista redirecionando para a página Lista de Compras

CT03 - Cadastro de usuário (home usuário admin)
    [Setup]    Cadastro de usuário admin
    Given que estou logado como usuário admin
    When clico no botão "Cadastrar"
    And o título da página de cadastro deve ser exibido corretamente     ${TEXTO_CADASTRO_HOME_ADMIN}
    And preencho o formulário de cadastro com os dados válidos
    And seleciono a opção "Cadastrar como administrador"    False
    And clico em "Cadastrar"
    Then o cadastro é concluído redirecionando para a página "Listar Usuários"

CT04 - Cadastro de usuário admin (home usuário admin)
    [Setup]    Cadastro de usuário admin
    Given que estou logado como usuário admin
    When clico no botão "Cadastrar"
    And o título da página de cadastro deve ser exibido corretamente     ${TEXTO_CADASTRO_HOME_ADMIN}
    And preencho o formulário de cadastro com os dados válidos
    And seleciono a opção "Cadastrar como administrador"    True
    And clico em "Cadastrar"
    Then o cadastro é concluído redirecionando para a página "Listar Usuários"