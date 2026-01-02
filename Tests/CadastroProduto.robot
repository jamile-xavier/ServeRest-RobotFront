*** Settings ***
Resource    ../ResourceS/Resource.robot
Resource    ../Resources/PO/Login.robot
Resource    ../Resources/PO/Home.robot
Resource    ../Resources/PO/CadastroUsuario.robot
Resource    ../Resources/PO/CadastroProduto.robot

Library    ../Library/faker_api.py

Suite Setup       Abrir o navegador
Test Setup        Cadastro de usuario admin
Suite Teardown    Fechar o navegador

*** Variables ***
${LINK_CADASTRO_PRODUTO}           //a[normalize-space()='Cadastrar Produtos']
${TEXTO_CADASTRO_PRODUTO}          //h1[normalize-space()='Cadastro de Produtos']
${INPUT_NOME_PRODUTO}              //input[@id='nome']
${INPUT_PRECO_PRODUTO}             //input[@id='price']
${INPUT_DESCRICAO_PRODUTO}         //textarea[@id='description']
${INPUT_QTDE_PRODUTO}              //input[@id='quantity']
${INPUT_IMAGEM_PRODUTO}            xpath=//input[@type='file']
${IMAGEM_PRODUTO}                  C:/Projetos/Robot/ServeRest-RobotFront/Image/Produto.jpg
${BTN_CADASTRAR_PRODUTO}           //button[normalize-space()='Cadastrar']
${TEXTO_LISTA_PRODUTOS}            //h1[normalize-space()='Lista dos Produtos']



*** Keywords ***
When clico em "Cadastrar Produtos"
    Click Element        ${LINK_CADASTRO_PRODUTO} 

And preencho o formulário de cadastro de produtos 
    [Arguments]    ${nome}    ${preco}    ${descricao}    ${quantidade}    
    Wait Until Element Is Visible    ${TEXTO_CADASTRO_PRODUTO}  
    Input Text    ${INPUT_NOME_PRODUTO}        ${nome}
    Input Text    ${INPUT_PRECO_PRODUTO}       ${preco}
    Input Text    ${INPUT_DESCRICAO_PRODUTO}   ${descricao}
    Input Text    ${INPUT_QTDE_PRODUTO}        ${quantidade}  
    # Choose File   ${INPUT_IMAGEM_PRODUTO}      ${imagem}

And preencho o formulário de cadastro de produtos com dados válidos 
    ${PRODUCT_NAME}    Get Product Name
    ${PRODUCT_PRICE}    Get Product Price
    ${PRODUCT_DESCRIPTION}    Get Product Description
    ${PRODUCT_QUANTITY}    Get Product Quantity
    Set Test Variable    ${NOME_PRODUTO}           ${PRODUCT_NAME}
    Set Test Variable    ${PRECO_PRODUTO}          ${PRODUCT_PRICE}
    Set Test Variable    ${DESCRICAO_PRODUTO}      ${PRODUCT_DESCRIPTION}
    Set Test Variable    ${QTDE_PRODUTO}           ${PRODUCT_QUANTITY}
    And preencho o formulário de cadastro de produtos      
    ...    ${NOME_PRODUTO}
    ...    ${PRECO_PRODUTO}
    ...    ${DESCRICAO_PRODUTO} 
    ...    ${QTDE_PRODUTO} 


And clico no botão "Cadastrar"
    Click Button    ${BTN_CADASTRAR_PRODUTO} 

Then o produto deverá ser cadastrado com sucesso redirecionando para página "Lista de Produtos"
    Wait Until Element Is Visible    ${TEXTO_LISTA_PRODUTOS} 

  

*** Test Cases ***

CT01 - Cadastro de produto com sucesso
    Given que estou logado como usuario admin
    When clico em "Cadastrar Produtos"
    And preencho o formulário de cadastro de produtos com dados válidos 
    And clico no botão "Cadastrar"
    Then o produto deverá ser cadastrado com sucesso redirecionando para página "Lista de Produtos"


# Scenario: Cadastro de produto com todos os campos em branco
#     When deixo todos os campos do formulário em branco 
#     And clico no botão "Cadastrar"
#     Then aparecerá a mensagem de erro: "Nome é obrigatório"
#     And aparecerá a mensagem de erro: "Preco é obrigatório"
#     And aparecerá a mensagem de erro: "Descricao é obrigatório"
#     And aparecerá a mensagem de erro: "Quantidade é obrigatório"
#     And o produto não será cadastrado

# Scenario: Cadastro de produto em duplicidade
#     When digito o nome de um produto já existente
#     And clico no botão "Cadastrar"
#     Then deverá aparecer a mensagem "Já existe produto com esse nome"
#     And o produto não será cadastrado

# Scenario: Cadastro de produto com preço negativo
#     When preencho o formulário de cadastro de produto informando um preço negativo
#     And clico no botão "Cadastrar"
#     Then deverá aparecer a mensagem "Preco deve ser um número positivo"
#     And o produto não será cadastrado

# Scenario: Cadastro de produto com quantidade negativa
#     When preencho o formulário de cadastro de produto informando a quantidade negativa
#     And clico no botão "Cadastrar"
#     Then deverá aparecer a mensagem "Quantidade deve ser maior ou igual a 0"
#     And o produto não será cadastrado
