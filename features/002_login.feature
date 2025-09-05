Feature: Login

    Eu, como usuário do ServeRest
    Gostaria de realizar login
    Porque desejo acessar o site

Background: Acessar página de login
    Given que estou na página inicial
    
Scenario Outline: Login realizado com sucesso
    Given que preencho o formulário de login com <dados>
    When clico no botão entrar
    Then sou autenticado com sucesso
    And acesso a página inicial do site
    
Examples: 
    | dados         |
    | dados válidos |

Scenario Outline: Tentativas de login inválidas
    Given que preencho o formulário de login com <dados>
    When clico no botão entrar
    Then aparecerá mensagem de erro: <mensagem>
    And o login não será realizado

Examples:
    | dados            | mensagem                                   |
    | campos em branco | "Email é obrigatório"                      |
    | campos em branco | "Password é obrigatório"                   |
    | e-mail inválido  | "Email deve ser um email válido"           |
    | senha inválida   | "Email e/ou senha inválidos"               |    
