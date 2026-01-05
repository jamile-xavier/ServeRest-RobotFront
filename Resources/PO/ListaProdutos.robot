*** Settings ***
Documentation    Lista de produtos


*** Variables ***
${LINK_LISTAR_PRODUTOS}                       //a[normalize-space()='Listar Produtos']
${TABELA_LISTA_PRODUTOS}                      //div[@class='jumbotron']
${TITULO_TABELA_LISTA_PRODUTOS}               //h1[normalize-space()='Lista dos Produtos']
${NOME_TABELA_PRODUTOS}                       //th[normalize-space()='Nome']
${PRECO_TABELA}                               //th[normalize-space()='Preço']
${DESCRICAO_TABELA}                           //th[normalize-space()='Descrição']
${QUANTIDADE_TABELA}                          //th[normalize-space()='Quantidade']
${IMAGEM_TABELA}                              //th[normalize-space()='Imagem']
${ACOES_TABELA_PRODUTOS}                      //th[normalize-space()='Ações']

@{CAMPOS_TABELA_PRODUTOS}
...    ${NOME_TABELA_PRODUTOS}
...    ${PRECO_TABELA}
...    ${DESCRICAO_TABELA}
...    ${QUANTIDADE_TABELA}
...    ${IMAGEM_TABELA}
...    ${ACOES_TABELA_PRODUTOS}

*** Keywords ***

When clico em "Listar Produtos"
    Click Element    ${LINK_LISTAR_PRODUTOS}

Then devo visualizar a lista de produtos cadastrados
    Wait Until Element Is Visible    ${TABELA_LISTA_PRODUTOS}
    Wait Until Element Is Visible    ${TITULO_TABELA_LISTA_PRODUTOS}

And cada produto listado deve apresentar os campos: "Nome", "Preço", "Descrição", "Quantidade", "Imagem", "Ações"
    FOR    ${campo}    IN    @{CAMPOS_TABELA_PRODUTOS}
        Element Should Be Visible    ${campo}
    END