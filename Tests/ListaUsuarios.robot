*** Settings ***
Resource    ${EXECDIR}/ResourceS/Resource.robot

Suite Setup       Abrir o navegador
Test Setup        Cadastro de usuário admin
Suite Teardown    Fechar o navegador

*** Test Cases ***

CT01 - Listar usuários
    Given que estou logado como usuário admin
    When clico em "Listar Usuários"
    Then serei redirecionada para página Lista dos usuários

CT02 - Visualizar as informações do usuário
    Given que estou logado como usuário admin
    When clico em "Listar Usuários"
    Then cada usuário listado deve apresentar os campos: "Nome", "Email", "Senha", "Administrador", "Ações"

# Ainda não disponível as ações abaixo
# CT03 - Editar usuário

# CT04 - Excluir usuário
