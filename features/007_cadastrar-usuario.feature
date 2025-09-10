Feature: Cadastrar Usuário

    Eu, como usuário administrador do ServeRest
    Gostaria de acessar a página cadastrar usuários
    Porque desejo cadastrar usuários comuns e administradores para que esses usuários acessem o site

Background: Usuário admin logado
    Given que estou logado como usuário admin
    And me encontro na página Cadastrar Usuários

Scenario Outline: Cadastro de usuário 
    Given que <acaoCheckbox>
    When clico no botão cadastrar
    Then o cadastro é concluído como <tipoUsuario>

Examples:
    | acaoCheckbox                                  | tipoUsuario     |
    | não marco o checkbox "Cadastrar como administrador?" | usuário comum   |
    | marco o checkbox "Cadastrar como administrador?"     | administrador   |

Scenario: Cadastro com campos obrigatórios em branco
    Given que deixo o formulário de cadastro em branco
    When clico em cadastrar
    Then aparecerá mensagem de erro: "Nome é obrigatório"
    And aparecerá mensagem de erro: "Email é obrigatório"
    And aparecerá mensagem de erro: "Password é obrigatório"
    And o cadastro não é finalizado

Scenario: Cadastro com e-mail já utilizado
    Given que preencho o formulário de cadastro com um e-mail já existente
    When clico no botão cadastrar
    Then aparecerá mensagem de erro: "Este email já está sendo usado"
    And o cadastro não é finalizado

Scenario: Cadastro com e-mail inválido
    Given que preencho o formulário de cadastro com um e-mail inválido
    And clico no botão cadastrar
    Then aparecerá mensagem de erro: "Email deve ser um email válido"
    And o cadastro não é finalizado