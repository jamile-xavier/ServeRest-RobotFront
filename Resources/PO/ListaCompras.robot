*** Settings ***
Documentation    Lista de compras

*** Variables ***
${TITULO_LISTA_COMPRAS}    //h1[normalize-space()='Lista de Compras']
${PAGINA_LISTA_COMPRAS}    //a[normalize-space()='Lista de Compras']
${ADD_ITEM_LISTA}          //button[normalize-space()='+']
${TOTAL_PRODUTO}           //p[contains(normalize-space(),'Total:')]
${DEL_ITEM_LISTA}          //button[normalize-space()='-']
${BTN_ADD_CARRINHO}        //button[normalize-space()='Adicionar no carrinho']
${BTN_LIMPAR_LISTA}        //button[normalize-space()='Limpar Lista']
${AREA_DO_TEXTO}           //p[@data-testid='shopping-cart-empty-message']
${MSG_LISTA_VAZIA}         Seu carrinho está vazio

*** Keywords ***
When adiciono produtos à lista de compras
    When clico em adicionar o produto à lista
    Then o produto deverá ser adicionado à lista redirecionando para a página Lista de Compras 

And acesso a página Lista de Compras
    Click Element          ${PAGINA_LISTA_COMPRAS}   

Then os itens adicionados deverão aparecer listados na tela
    Wait Until Element Is Visible    ${CARD_PRODUTO} 

When acesso a página Lista de Compras
    And acesso a página Lista de Compras

And clico no ícone "+"
    Click Button    ${ADD_ITEM_LISTA}  

And capturo a quantidade atual do produto
    ${texto}=    Get Text    ${TOTAL_PRODUTO}
    ${quantidade_atual}=    Replace String    ${texto}    Total:    ${EMPTY}
    ${quantidade_atual}=    Convert To Integer    ${quantidade_atual}
    Set Test Variable    ${QTD_ANTES}    ${quantidade_atual}

Then a quantidade do produto deverá ser incrementada em 1
    Wait Until Element Is Visible    ${TOTAL_PRODUTO}
    ${texto}=    Get Text    ${TOTAL_PRODUTO}
    ${quantidade_depois}=    Replace String    ${texto}    Total:    ${EMPTY}
    ${quantidade_depois}=    Convert To Integer    ${quantidade_depois}
    Should Be Equal As Integers    ${quantidade_depois}    ${QTD_ANTES + 1}

And clico no ícone "-"
    Click Button    ${DEL_ITEM_LISTA} 

Then a quantidade do produto deverá ser decrementada em 1
    Wait Until Element Is Visible    ${TOTAL_PRODUTO}
    ${texto}=    Get Text    ${TOTAL_PRODUTO}
    ${quantidade_depois}=    Replace String    ${texto}    Total:    ${EMPTY}
    ${quantidade_depois}=    Convert To Integer    ${quantidade_depois}
    Should Be Equal As Integers    ${quantidade_depois}    ${QTD_ANTES - 1}

And clico no botão "Adicionar ao carrinho"
    Click Button    ${BTN_ADD_CARRINHO} 

# Then todos os produtos da lista deverão ser adicionados ao carrinho

And clico no botão "Limpar Lista"
    Click Button    ${BTN_LIMPAR_LISTA}

Then todos os produtos da lista deverão ser removidos 
    Wait Until Element Is Visible    ${AREA_DO_TEXTO} 
    Element Text Should Be      ${AREA_DO_TEXTO}       ${MSG_LISTA_VAZIA} 