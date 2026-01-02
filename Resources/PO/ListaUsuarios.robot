*** Settings ***
Library     SeleniumLibrary
Library     String

*** Variables ***
${LINK_LISTAR_USUARIOS}             //a[normalize-space()='Listar Usuários']
${TABELA_LISTA_USUARIOS}            //div[@class='jumbotron']
${TITULO_TABELA_LISTA_USUARIOS}     Lista dos usuários
${NOME_TABELA}                      //th[normalize-space()='Nome']
${EMAIL_TABELA}                     //th[normalize-space()='Email']
${SENHA_TABELA}                     //th[normalize-space()='Senha']
${ADMIN_TABELA}                     //th[normalize-space()='Administrador']
${ACOES}                            //th[normalize-space()='Ações']

*** Keywords ***
When clico em "Listar Usuários"
    Click Element    ${LINK_LISTAR_USUARIOS} 

Then serei redirecionada para página Lista dos usuários
    Wait Until Element Is Visible    ${TABELA_LISTA_USUARIOS}
    Title Should Be    ${TITULO_TABELA_LISTA_USUARIOS}

Then cada usuário listado deve apresentar os campos: "Nome", "Email", "Senha", "Administrador", "Ações"
    Page Should Contain Element    ${NOME_TABELA}  
    Page Should Contain Element    ${EMAIL_TABELA}
    Page Should Contain Element    ${SENHA_TABELA}  
    Page Should Contain Element    ${ADMIN_TABELA}  
    Page Should Contain Element    ${ACOES}     

