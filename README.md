# Controller - Raro Food

O projeto inicia algumas implementações de rotas e controllers tendo como base o banco de dados modelado durante as semanas 7, 8 e 9 da turma de Ruby on Rails - Raro Academy, referente ao projeto Raro Food.

## Objetivos

Tendo como base o [enunciado do exercício](./.gitlab/enunciado.md), os objetivos são:

- [x] Declarar de forma coerente as rotas, utilizando o formato mais indicado de acordo com os métodos que devem ser expostos;
  - A lista das rotas solicitadas pode ser verificada [aqui](./.gitlab/routes_checklist.md).
- [x] Declarar os controllers e seus respectivos métodos conforme as ações que devem ser expostas.

## Desenvolvimento

A atividade foi iniciada seguindo a lista de rotas do enunciado, foi possível realizar algumas _actions_ básicas e deixa-las funcionando. Contudo, alguns erros foram aparecendo ao tentar acessar os relacionamentos de alguns _models_. Por isso, foi realizada uma refatoração geral utilizando _nested resources_. Usando esse recurso foi possível acessar as informações das rotas corretamente.

Abaixo estão listados outros pontos importantes referente ao desenvolvimento da atividade.

1. No projeto utilizado de base já havia um `seeds.rb` com informações de States e Cities, esse arquivo foi incrementado para popular todas as outras tabelas do banco de dados utilizando a gem [Faker](https://github.com/faker-ruby/faker) na sua versão mais recente. Dessa forma, conseguimos visualizar informações ao realizar requisições;

2. Chef e Customer herdam atributos de _User_, por isso ao renderizar apenas `@customer` o retorno recebido seria a referencia para seu _user_id_. Como foi considerado importante retornar todas as informações como _name_, _cpf_ e _e-mail_, na action **show** desses dois controllers foi configurado o formato do json necessário para exibir os dados completos;

3. Foram criados controllers para **Addresses** e **Telephones** e foi acrescentada uma lógica para que seja possível identificar as informações que pertencem a _Chef_ ou _Customer_ sendo possível que suas actions retorne corretamente as informações. Com esses controllers criados, foi optado por expor algumas rotas extras, tais quais:

   - /telephones
   - /telephones/:id
   - /addresses
   - /addresses/:id

4. No controller de **Dishes** também foi incluído um `if` para que a action index verifique se a requisição está vindo da rota de _Order_ ou de _Chef_;

5. Outro controller criado foi o **order_items_controller** que gerencia as actions das rotas que _Order_ precisa para visualização dos seus itens.

### Resultado

Os testes das rotas implementadas foram realizados utilizando o [Insomnia](https://insomnia.rest), através de um ambiente que foi criado e dentro dele _folders_ com todas as requisições necessárias. Abaixo podem ser visualizados alguns resultados, mas para verificar todos é possível realizar o _import_ do arquivo [_insomnia.json_](./insomnia.json) que está na raiz do projeto.

  <div align="center">
    <img src="./.gitlab/screenshots/insomnia_chefs.png " alt="preview exerc" width="33%">
    <img src="./.gitlab/screenshots/insomnia_customer.png " alt="preview exerc" width="33%">
    <img src="./.gitlab/screenshots/insomnia_customer.png " alt="preview exerc" width="33%">
  </div>

## Setup

O projeto foi realizado utilizando as versões:

- ruby 3.1.2;
- rails 7.0.4.3.

Antes de iniciar a aplicação, é necessário exportar as variáveis de ambientes no terminal, de acordo com seu acesso pessoal ao MySQL:

```bash
  export MYQSL_USER=SEU_USUARIO
  export MYQSL_PASSWORD=SUA_SENHA
  export MYQSL_HOST=localhost
```

Recomenda-se também a execução da seguinte sequência de comandos:

```bash
  bundle install
  rails db:create
  rails db:migrate
  rails db:seed
```

Para iniciar o servidor recomenda-se a utilização do comando `./bin/dev`, pois ele garante que os _assets_ serão todos devidamente processados.

É possível, caso queira, aproveitar as requisições previamente configuradas usando o [Insomnia](https://insomnia.rest), basta importar esse [arquivo](./insomnia.json).
