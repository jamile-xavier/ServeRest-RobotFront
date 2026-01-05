*** Settings ***
Documentation    Login

*** Variables ***
${LOGIN_URL}                           https://front.serverest.dev/login
${LOGIN_IMAGE}                         //img[@class='imagem']
${LINK_CADASTRO}                       //a[normalize-space()='Cadastre-se']
${INPUT_EMAIL}                         email    
${INPUT_SENHA}                         password
${BTN_ENTRAR}                          //button[normalize-space()='Entrar']
${TEXTO_SENHA_BRANCO_LOGIN}            //div[@role='alert']
${EMAIL_CORRETO_NAO_CADASTRADO}        ester_pizetta1@globo.com
${SENHA_INVALIDA}                      1
${TEXTO_EMAIL_SENHA_INVALIDOS}        //span[normalize-space()='Email e/ou senha inválidos']


*** Keywords ***
Given que estou na página inicial
    Go To    ${LOGIN_URL}
    Wait Until Element Is Visible    ${LOGIN_IMAGE}

And clico em "Entrar"
    Click Button    ${BTN_ENTRAR}  

When clico em "Cadastre-se"
    Click Link    ${LINK_CADASTRO}

When que preencho o formulário de login com dados válidos
    Input Text        ${INPUT_EMAIL}      ${EMAIL}
    Input Password    ${INPUT_SENHA}      ${SENHA}

And clico no botão "ENTRAR"
    Click Button     ${BTN_ENTRAR}  

Then serei redirecionada para página "Home"
    Wait Until Element Is Visible    ${HOME_USUARIO}  

When que preencho o formulário de login com e-mail em branco 
    Input Text        ${INPUT_EMAIL}      ${EMPTY}
    Input Password    ${INPUT_SENHA}      ${SENHA}

Then apresenta a mensagem "Email é obrigatório"   
    Wait Until Element Is Visible             ${TEXTO_EMAIL_VAZIO} 

When que preencho o formulário de login com senha em branco 
    Input Text        ${INPUT_EMAIL}      ${EMAIL}
    Input Password    ${INPUT_SENHA}      ${EMPTY}

Then apresenta a mensagem "Password não pode ficar em branco" 
    Wait Until Element Is Visible             ${TEXTO_SENHA_BRANCO_LOGIN} 

When que preencho o formulário de login com e-mail inválido 
    Input Text        ${INPUT_EMAIL}      ${EMAIL_CORRETO_NAO_CADASTRADO}
    Input Password    ${INPUT_SENHA}      ${SENHA}

Then apresenta a mensagem "Email e/ou senha inválidos"  
    Wait Until Element Is Visible             ${TEXTO_EMAIL_SENHA_INVALIDOS}

When que preencho o formulário de login com senha inválida
    Input Text        ${INPUT_EMAIL}      ${EMAIL}
    Input Password    ${INPUT_SENHA}      ${SENHA_INVALIDA}

Realizar Login
    Given que estou na página inicial
    When que preencho o formulário de login com dados válidos
    And clico no botão "ENTRAR"
    Then serei redirecionada para página "Home"