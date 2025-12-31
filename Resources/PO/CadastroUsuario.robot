*** Settings ***
Library    SeleniumLibrary
Library    String
Library    ../../Library/faker_api.py
Resource     ../PO/Login.robot


*** Variables ***
${TEXTO_CADASTRO}                    //h2[normalize-space()='Cadastro']
${INPUT_NOME}                        nome
${INPUT_EMAIL}                       email
${INPUT_SENHA}                       password
${ADMINISTRADOR}                     administrador
${BTN_CADASTRAR}                     //button[normalize-space()='Cadastrar']
${TEXTO_SUCESSO}                     //div[@class='alert alert-dismissible alert-primary']
${TEXTO_NOME_VAZIO}                  //span[normalize-space()='Nome é obrigatório']
${TEXTO_EMAIL_VAZIO}                 //span[normalize-space()='Email é obrigatório']
${TEXTO_SENHA_VAZIA}                 //span[normalize-space()='Password é obrigatório']
${EMAIL_DUPLICADO}                   theodorosampaio@example.net
${TEXTO_EMAIL_DUPLICADO}             //div[@role='alert']
${EMAIL_INVALIDO}                    theodorosampaio@com
${TEXTO_EMAIL_INVALIDO}              //span[normalize-space()='Email deve ser um email válido']

*** Keywords ***
And preencho o formulário de cadastro
    [Arguments]    ${nome}    ${email}    ${password}
    Wait Until Element Is Visible    ${TEXTO_CADASTRO} 
    Input Text    ${INPUT_NOME}      ${nome}   
    Input Text    ${INPUT_EMAIL}     ${email}  
    Input Password    ${INPUT_SENHA}      ${password}

And preencho o formulário de cadastro com os dados válidos
    ${NOME}        Get Name
    ${EMAIL}       Get Email
    ${PASSWORD}    Get Password
    Set Test Variable    ${EMAIL}       ${EMAIL}
    Set Test Variable    ${SENHA}    ${PASSWORD}
    And preencho o formulário de cadastro    ${NOME}     ${EMAIL}     ${PASSWORD}

And clico em "Cadastrar"
    Click Button    ${BTN_CADASTRAR} 

Then o cadastro é concluído
    Wait Until Element Is Visible    ${TEXTO_SUCESSO}

And seleciono a opção "Cadastrar como administrador"
    [Arguments]    ${selecionar_admin}    
    IF    ${selecionar_admin} == 'True'
    Select Checkbox    ${ADMINISTRADOR}  
    END

Cadastro de usuario
    Given que estou na página inicial
    When clico em "Cadastre-se"
    And preencho o formulário de cadastro com os dados válidos
    And seleciono a opção "Cadastrar como administrador"    False
    And clico em "Cadastrar"
    Then o cadastro é concluído

Cadastro de usuario admin
    Given que estou na página inicial
    When clico em "Cadastre-se"
    And preencho o formulário de cadastro com os dados válidos
    And seleciono a opção "Cadastrar como administrador"    True
    And clico em "Cadastrar"
    Then o cadastro é concluído

Then aparecerá mensagem de erro: "Nome é obrigatório"
    Wait Until Element Is Visible    ${TEXTO_NOME_VAZIO} 

And aparecerá mensagem de erro: "Email é obrigatório"
    Wait Until Element Is Visible     ${TEXTO_EMAIL_VAZIO}

And aparecerá mensagem de erro: "Password é obrigatório"
    Wait Until Element Is Visible     ${TEXTO_SENHA_VAZIA} 

And deixo o formulário de cadastro em branco    
    And preencho o formulário de cadastro    
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}

And preencho o formulário de cadastro com e-mail já existente    
    ${NOME}        Get Name
    ${PASSWORD}    Get Password
    And preencho o formulário de cadastro    ${NOME}     ${EMAIL_DUPLICADO}     ${PASSWORD}

Then aparecerá mensagem de erro: "Este email já está sendo usado"  
    Wait Until Element Is Visible    ${TEXTO_EMAIL_DUPLICADO}

And preencho o formulário de cadastro com e-mail inválido
    ${NOME}        Get Name
    ${PASSWORD}    Get Password
    And preencho o formulário de cadastro    ${NOME}     ${EMAIL_INVALIDO}     ${PASSWORD}

Then aparecerá mensagem de erro: "Email deve ser um email válido"
    Wait Until Element Is Visible    ${TEXTO_EMAIL_INVALIDO}