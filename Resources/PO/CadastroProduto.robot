*** Settings ***
Documentation    Cadastro de produto


*** Variables ***
${LINK_CADASTRO_PRODUTO}                //a[normalize-space()='Cadastrar Produtos']
${TEXTO_CADASTRO_PRODUTO}               //h1[normalize-space()='Cadastro de Produtos']
${INPUT_NOME_PRODUTO}                   //input[@id='nome']
${INPUT_PRECO_PRODUTO}                  //input[@id='price']
${INPUT_DESCRICAO_PRODUTO}              //textarea[@id='description']
${INPUT_QTDE_PRODUTO}                   //input[@id='quantity']
${INPUT_IMAGEM_PRODUTO}                 xpath=//input[@type='file']
${IMAGEM_PRODUTO}                       C:/Projetos/Robot/ServeRest-RobotFront/Image/Produto.jpg
${BTN_CADASTRAR_PRODUTO}                //button[normalize-space()='Cadastrar']
${TEXTO_LISTA_PRODUTOS}                 //h1[normalize-space()='Lista dos Produtos']
${SPAN_MSG_NOME_OBRIGATORIO}            //span[normalize-space()='Nome é obrigatório']
${SPAN_MSG_PRECO_OBRIGATORIO}           //span[normalize-space()='Preco é obrigatório']
${SPAN_MSG_DESCRICAO_OBRIGATORIO}       //span[normalize-space()='Descricao é obrigatório']
${SPAN_MSG_QUANTIDADE_OBRIGATORIO}      //span[normalize-space()='Quantidade é obrigatório']
${MSG_NOME_OBRIGATORIO}                 Nome é obrigatório
${MSG_PRECO_OBRIGATORIO}                Preco é obrigatório
${MSG_DESCRICAO_OBRIGATORIO}            Descricao é obrigatório
${MSG_QUANTIDADE_OBRIGATORIO}           Quantidade é obrigatório
${NOME_PRODUTO_DUPLICIDADE}             Câmera XG
${SPAN_PRODUTO_DUPLICIDADE}             //span[normalize-space()='Já existe produto com esse nome']
${MSG_PRODUTO_DUPLICIDADE}              Já existe produto com esse nome
${PRECO_NEGATIVO}                       -25
${SPAN_PRECO_NEGATIVO}                  //span[normalize-space()='Preco deve ser um número positivo']
${MSG_PRECO_NEGATIVO}                   Preco deve ser um número positivo
${QUANTIDADE_NEGATIVA}                  -6
${SPAN_QUANTIDADE_NEGATIVA}             //span[normalize-space()='Quantidade deve ser maior ou igual a 0']
${MSG_QUANTIDADE_NEGATIVA}              Quantidade deve ser maior ou igual a 0

*** Keywords ***
When clico em "Cadastrar Produtos"
    Click Element        ${LINK_CADASTRO_PRODUTO} 

And preencho o formulário de cadastro de produtos 
    [Arguments]    ${nome}    ${preco}    ${descricao}    ${quantidade}    
    Wait Until Element Is Visible       ${TEXTO_CADASTRO_PRODUTO}  
    Input Text                          ${INPUT_NOME_PRODUTO}        ${nome}
    Input Text                          ${INPUT_PRECO_PRODUTO}       ${preco}
    Input Text                          ${INPUT_DESCRICAO_PRODUTO}   ${descricao}
    Input Text                          ${INPUT_QTDE_PRODUTO}        ${quantidade}  
    # Choose File                       ${INPUT_IMAGEM_PRODUTO}      ${imagem}

And preencho o formulário de cadastro de produtos com dados válidos 
    ${PRODUCT_NAME}           Get Product Name
    ${PRODUCT_PRICE}          Get Product Price
    ${PRODUCT_DESCRIPTION}    Get Product Description
    ${PRODUCT_QUANTITY}       Get Product Quantity
    Set Test Variable    ${NOME_PRODUTO}           ${PRODUCT_NAME}
    Set Test Variable    ${PRECO_PRODUTO}          ${PRODUCT_PRICE}
    Set Test Variable    ${DESCRICAO_PRODUTO}      ${PRODUCT_DESCRIPTION}
    Set Test Variable    ${QTDE_PRODUTO}           ${PRODUCT_QUANTITY}
    And preencho o formulário de cadastro de produtos      
    ...    ${NOME_PRODUTO}
    ...    ${PRECO_PRODUTO}
    ...    ${DESCRICAO_PRODUTO} 
    ...    ${QTDE_PRODUTO} 

And não preencho os campos do formulário de produto  
    And preencho o formulário de cadastro de produtos    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    

 And preencho o formulário de cadastro com um produto já existente
    ${PRODUCT_PRICE}          Get Product Price
    ${PRODUCT_DESCRIPTION}    Get Product Description
    ${PRODUCT_QUANTITY}       Get Product Quantity
    And preencho o formulário de cadastro de produtos    ${NOME_PRODUTO_DUPLICIDADE}     ${PRODUCT_PRICE}   ${PRODUCT_DESCRIPTION}    ${PRODUCT_QUANTITY} 

And preencho o formulário de cadastro de produto informando um preço negativo
    ${PRODUCT_NAME}           Get Product Name
    ${PRODUCT_DESCRIPTION}    Get Product Description
    ${PRODUCT_QUANTITY}       Get Product Quantity
    And preencho o formulário de cadastro de produtos    ${PRODUCT_NAME}     ${PRECO_NEGATIVO}    ${PRODUCT_DESCRIPTION}    ${PRODUCT_QUANTITY}

And preencho o formulário de cadastro de produto informando a quantidade negativa
    ${PRODUCT_NAME}           Get Product Name
    ${PRODUCT_PRICE}          Get Product Price
    ${PRODUCT_DESCRIPTION}    Get Product Description
    And preencho o formulário de cadastro de produtos    ${PRODUCT_NAME}     ${PRODUCT_PRICE}     ${PRODUCT_DESCRIPTION}    ${QUANTIDADE_NEGATIVA}

And clico no botão "Cadastrar"
    Click Button    ${BTN_CADASTRAR_PRODUTO} 

Then o produto deverá ser cadastrado com sucesso redirecionando para página "Lista de Produtos"
    Wait Until Element Is Visible    ${TEXTO_LISTA_PRODUTOS} 

Then aparecerá a mensagem de erro: "Nome é obrigatório"
    Sleep    5
    Element Text Should Be    ${SPAN_MSG_NOME_OBRIGATORIO}    ${MSG_NOME_OBRIGATORIO}      
    
And aparecerá a mensagem de erro: "Preco é obrigatório"
    Sleep    5
    Element Text Should Be    ${SPAN_MSG_PRECO_OBRIGATORIO}    ${MSG_PRECO_OBRIGATORIO}

And aparecerá a mensagem de erro: "Descricao é obrigatório"
    Sleep    5
    Element Text Should Be    ${SPAN_MSG_DESCRICAO_OBRIGATORIO}    ${MSG_DESCRICAO_OBRIGATORIO}

And aparecerá a mensagem de erro: "Quantidade é obrigatório"
    Sleep    5
    Element Text Should Be    ${SPAN_MSG_QUANTIDADE_OBRIGATORIO}    ${MSG_QUANTIDADE_OBRIGATORIO}

Then deverá aparecer a mensagem "Já existe produto com esse nome"
    Sleep    5
    Element Text Should Be    ${SPAN_PRODUTO_DUPLICIDADE}     ${MSG_PRODUTO_DUPLICIDADE}

 Then deverá aparecer a mensagem "Preco deve ser um número positivo"
    Sleep    5
    Element Text Should Be    ${SPAN_PRECO_NEGATIVO}     ${MSG_PRECO_NEGATIVO}

Then deverá aparecer a mensagem "Quantidade deve ser maior ou igual a 0"
    Sleep    5
    Element Text Should Be      ${SPAN_QUANTIDADE_NEGATIVA}    ${MSG_QUANTIDADE_NEGATIVA}