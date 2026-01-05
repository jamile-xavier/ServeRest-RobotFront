<h1 align="Center"> Teste de Automação Web Com Robot Framework + Selenium Library - ServeRest </h1>

![Projeto ServeRest Robot API](./ServeRestRobotWeb.png)

<h2 align="center">
Teste Web ServeRest
</h2>
<p> O ServeRest simula uma loja virtual sendo disponibilizada gratuitamente para estudos. </p>
<p>Testes de Login, Usuários, Produtos e Carrinho.</p>
<p>Permite o cadastro de 2 tipos de usuário: usuário administrador e usuário não administrador. </p>
<p>Ao usuário administrador é permitido o cadastro de usuários, consulta de usuários, cadastro de produtos, consulta de produtos.</p>
<p>Ao usuário não administrador é permitido adicionar produtos a lista de compras, consultar a lista de compras, adicionar ou remover quantidade de um item na lista de compras. </p>
<p> Acesso ao Front ServeRest: https://front.serverest.dev/login</p>
<p> Acesso ao repositório do projeto ServeRest: github.com/ServeRest/ServeRest</p>

### Funcionalidades

- [x] Realizar login;
- [x] Realizar logout;
- [x] Cadastrar usuário (página inicial ou pela home admin);
- [x] Listar usuários cadastrados (home admin);
- [x] Cadastrar produto (home admin);
- [x] Listar produtos cadastrados (home admin);
- [x] Adicionar item a lista de compras (home não admin);
- [x] Lista de compras (home não admin);
- [x] Adicionar quantiade de item na lista de compras (home não admin);
- [x] Remover quantidade de item na lista de compras (home não admin);

### Tecnologias

- [Robot Framework](https://robotframework.org/)
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- [Faker](https://faker.readthedocs.io/en/stable/)
- [VsCode](https://code.visualstudio.com/)

### Executando-o-projeto

Passo a passo utilizando o VsCode:

- Realizar o dowload do projeto;
- Abrir o VsCode;
- Clicar em File;
- Open Folder;
- Selecionar pasta;
- Abrir o terminal e digitar o comando para instalar as dependências (o comando abaixo realizará a instalação de todas as dependências necessárias):

```bash
pip install -r requeriments.txt
```

- Digitar no terminal o comando para executar todos os testes

```bash
robot -d ./results Tests/
```

Para executar os testes por arquivo:

Teste de login:

```bash
robot -d ./results Tests/Login.robot
```

Teste de logout:

```bash
robot -d ./results Tests/Logout.robot
```

Teste de cadastro de home:

```bash
robot -d ./results Tests/Home.robot
```

Teste de cadastro de usuário:

```bash
robot -d ./results Tests/CadastroUsuario.robot
```

Teste de lista de usuários:

```bash
robot -d ./results Tests/ListaUsuarios.robot
```

Teste de cadastro de produto:

```bash
robot -d ./results Tests/CadastroProduto.robot
```

Teste de lista de produtos:

```bash
robot -d ./results Tests/ListaProdutos.robot
```
Teste de lista de compras:

```bash
robot -d ./results Tests/ListaCompras.robot
```

### Autora

<p> Jamile Xavier Mendonça </p>

[Github](https://github.com/jamile-xavier)

[Linkedin](https://www.linkedin.com/in/jamile-xavier/)

### Licença

MIT