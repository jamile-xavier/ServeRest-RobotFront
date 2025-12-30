*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${TEXTO_CADASTRO}    //h2[normalize-space()='Cadastro']
${INPUT_NOME}    nome
${INPUT_EMAIL}    email
${INPUT_SENHA}    password
${ADMINISTRADOR}    administrador
${BTN_CADASTRAR}     //button[normalize-space()='Cadastrar']
${TEXTO_SUCESSO}    //div[@class='alert alert-dismissible alert-primary']

*** Keywords ***
And preencho o formulário de cadastro
    Wait Until Element Is Visible    ${TEXTO_CADASTRO} 
    ${NOME}    Get Name
    ${EMAIL}    Get Email
    ${PASSWORD}    Get Password
    Input Text    ${INPUT_NOME}     ${NOME}   
    Input Text    ${INPUT_EMAIL}     ${EMAIL}  
    Input Password    ${INPUT_SENHA}      ${PASSWORD}  

And clico em "Cadastrar"
    Click Button    ${BTN_CADASTRAR} 

Then o cadastro é concluído
    Wait Until Element Is Visible    ${TEXTO_SUCESSO}

And seleciono a opção "Cadastrar como administrador"
    Select Checkbox    ${ADMINISTRADOR}  