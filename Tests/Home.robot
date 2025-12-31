*** Settings ***
Library    SeleniumLibrary
Library    String
# Resource    ../Resource.robot
Resource    ../Resources/PO/Home.robot
Resource    ../Resources/PO/CadastroUsuario.robot

Suite Setup       Abrir o navegador
Test Setup        Cadastro de usuario
Suite Teardown    Fechar o navegador

*** Test Cases ***
CT01 - Pesquisa de produtos (usuário não admin)
    Given que estou logado como usuario comum
    When clico no campo de Pesquisar produtos e digito o nome do produto "Logitech MX Vertical" 
    And clico no botão Pesquisar
    Then deverá mostrar o produto que pesquisei


CT02 - Adicionar produto a lista (usuário não admin)
    Given que estou logado como usuario comum
    When clico em adicionar o produto à lista
    Then o produto deverá ser adicionado à lista redirecionando para a página Lista de Compras
