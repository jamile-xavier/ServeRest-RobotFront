*** Settings ***
Documentation    Lista de usuários

*** Variables ***
${LINK_LISTAR_USUARIOS}             //a[normalize-space()='Listar Usuários']
${TABELA_LISTA_USUARIOS}            //div[@class='jumbotron']
${TITULO_TABELA_LISTA_USUARIOS}     //h1[normalize-space()='Lista dos usuários']
${NOME_TABELA}                      //th[normalize-space()='Nome']
${EMAIL_TABELA}                     //th[normalize-space()='Email']
${SENHA_TABELA}                     //th[normalize-space()='Senha']
${ADMIN_TABELA}                     //th[normalize-space()='Administrador']
${ACOES}                            //th[normalize-space()='Ações']

@{CAMPOS_TABELA_USUARIOS}
...    ${NOME_TABELA}
...    ${EMAIL_TABELA}
...    ${SENHA_TABELA}
...    ${ADMIN_TABELA}
...    ${ACOES}

*** Keywords ***
When clico em "Listar Usuários"
    Click Element    ${LINK_LISTAR_USUARIOS} 

Then serei redirecionada para página Lista dos usuários
    Wait Until Element Is Visible    ${TABELA_LISTA_USUARIOS}
    Wait Until Element Is Visible   ${TITULO_TABELA_LISTA_USUARIOS}

Then cada usuário listado deve apresentar os campos: "Nome", "Email", "Senha", "Administrador", "Ações"
    FOR    ${campo}    IN    @{CAMPOS_TABELA_USUARIOS}
        Element Should Be Visible    ${campo}
    END
