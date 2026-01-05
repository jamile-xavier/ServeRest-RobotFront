*** Settings ***
Resource    ${EXECDIR}/Resources/Resource.robot

Suite Setup    Abrir o navegador
Suite Teardown    Fechar o navegador

*** Test Cases ***

CT01 - Cadastro de usuário 
    Given que estou na página inicial
    When clico em "Cadastre-se"
    And o título da página de cadastro deve ser exibido corretamente    ${TEXTO_CADASTRO_INICIAL}
    And preencho o formulário de cadastro com os dados válidos
    And seleciono a opção "Cadastrar como administrador"    ${False}
    And clico em "Cadastrar"
    Then o cadastro é concluído

CT02 - Cadastro de usuário administrador
    Given que estou na página inicial
    When clico em "Cadastre-se"
    And o título da página de cadastro deve ser exibido corretamente    ${TEXTO_CADASTRO_INICIAL}
    And preencho o formulário de cadastro com os dados válidos
    And seleciono a opção "Cadastrar como administrador"    ${True}
    And clico em "Cadastrar"
    Then o cadastro é concluído

CT03 - Cadastro com campos obrigatórios em branco
    Given que estou na página inicial
    When clico em "Cadastre-se"
    And deixo o formulário de cadastro em branco 
    And seleciono a opção "Cadastrar como administrador"    False
    And clico em "Cadastrar"
    Then aparecerá mensagem de erro: "Nome é obrigatório"
    And aparecerá mensagem de erro: "Email é obrigatório"
    And aparecerá mensagem de erro: "Password é obrigatório"

CT04 - Cadastro com e-mail já utilizado
    Given que estou na página inicial
    When clico em "Cadastre-se"
    And preencho o formulário de cadastro com e-mail já existente 
    And seleciono a opção "Cadastrar como administrador"    False
    And clico em "Cadastrar"
    Then aparecerá mensagem de erro: "Este email já está sendo usado"   

CT05 - Cadastro com e-mail inválido
    Given que estou na página inicial
    When clico em "Cadastre-se"
    And preencho o formulário de cadastro com e-mail inválido 
    And seleciono a opção "Cadastrar como administrador"    False
    And clico em "Cadastrar"
    Then aparecerá mensagem de erro: "Email deve ser um email válido"
