Feature: Menu e Logout (Header)

    Eu, como usuário do ServeRest
    Gostaria de navegar pelo menu e realizar logout
    Porque desejo acessar funcionalidades e encerrar a sessão corretamente

Background: Acessar página home
    Given que estou na página home
    
Scenario Outline: Menu do usuário
    Given que estou logado como usuário <usuario>
    When acesso o menu
    Then deverá aparecer as seguintes opções: <opcoes>

Examples:
    | usuario | opcoes                                           |
    | comum   | Home, Lista de compras, Carrinho, Logout       |
    | admin   | Home, Cadastrar usuários, Listar usuários, Cadastrar Produtos, Listar Produtos, Relatórios, Logout |


Scenario Outline: Realizar logout
    Given que estou logado como usuário <usuario>
    When clico no botão logout
    Then o logout deverá ser realizado redirecionando para página de login
    
Examples:
    | usuario |          
    | comum   | 
    | admin   |        
      