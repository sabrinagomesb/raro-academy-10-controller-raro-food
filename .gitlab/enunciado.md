Prática 01 - Semana 10

Nesse exercício iremos abordar o conteúdo apresentado nas aulas dessa semana 10.

Daremos continuidade ao desenvolvimento da nossa aplicação RaroFood, agora aplicando os conhecimentos adquiridos sobre Rotas e Controllers no Rails.

Vocês deverão implementar o fluxo de requisições correspondente à modelagem já existente no projeto, adicionando as rotas e controllers conforme apresentado durante a semana.

O que será considerado na avaliação desse exercício:

1. Declaração coerente das rotas, utilizando o formato mais indicado de acordo com os métodos que devem ser expostos. Segue uma relação com as rotas que precisam ser implementadas:

Model Chef:
/chefs
/chefs/:id
/chefs/:chef_id/address
/chefs/:chef_id/city
/chefs/:chef_id/state
/chefs/:chef_id/telephones
/chefs/:chef_id/dishes

Model Coupon:
/coupons
/coupons/:id
/coupons/:coupon_id/orders

Model Customer:
/customers
/customers/:id
/customers/:customer_id/orders
/customers/:customer_id/addresses/:id
/customers/:customer_id/telephones
/customers/:customer_id/cards/:id

Model Dish:
/dishes
/dishes/:id
/dishes/:dish_id/categories

Model Order:
/orders
/orders/:id
/orders/:order_id/order_items
/orders/:order_id/order_items/:id
/orders/:order_id/dishes
/orders/:order_id/dishes/:id
/orders/:order_id/city
/orders/:order_id/payment

Model Payment:
/payments
/payments/:id
/payments/:payment_id/customer

Model State:
/states
/states/:id
/states/:state_id/cities

2. Declaração dos controllers e seus respectivos métodos, conforme as ações que devem ser expostas.

Observações:
Views não serão avaliadas nesta atividade, mas podem ser implementadas para facilitar testes de uso da aplicação.
Vocês devem utilizar a versão mais recente disponibilizada no repositório:
https://git.raroacademy.com.br/turmas-ruby/ruby-turma1/ruby-alunos/raro-food
Seguem também os links para os slides apresentados em aula:

Aula 1 - Pontos Importantes

https://docs.google.com/presentation/d/1AzivJJRVLSHPNXbQvCB-Mipsupy9UYp6nIc817AIxo8/edit?usp=share_link

Aula 2 - Rotas
https://docs.google.com/presentation/d/1NF8QA-GV_a6JLMfHvPj1RhxYG3X2thwRrpRVKQ_HzJQ

Aula 3 - Controllers
https://docs.google.com/presentation/d/10yvRHcbKyZVaVFqcKbhyJiXeVkPmqhkLvSTX6ANgRHE/edit?usp=share_link

Aula 4 - Rotas e Controllers - Conceitos avançados
https://docs.google.com/presentation/d/1DnAQ4rip6E6Ep3lMYGPZBaeDESkYeqZ2aGCJ0_SshAM/edit?usp=share_link

Como deverá ser entregue:

Até a data de entrega do exercício, você deverá realizar um fork do repositório em sua conta privada do gitlab da Raro Academy, realizar todo o desenvolvimento da nossa prática e publicar todo seu conteúdo na branch main.

Para entrega no classroom, vocês devem anexar o link para esse repositório.

Não se esqueça de dar a permissão de "developer" aos professores e monitores desta turma, caso contrário, eles não terão acesso à sua entrega.

Seu repositório deve conter todos os arquivos necessários para o devido funcionamento do seu projeto.

Ainda no seu repositório, altere o arquivo README.md adicionando uma seção onde será descrita a resolução e as premissas adotadas por você. Estas descrições serão levadas em consideração na avaliação da sua entrega, além de ajudar muito os professores.

Os professores deverão avaliar sua entrega até o último commit feito até a data limite. Caso sua entrega possua commits após a data limite, nós avaliaremos a entrega considerando as penalidades de atraso. Para avaliar sua entrega, utilizaremos o ambiente de desenvolvimento do rails.

Garanta que tudo esteja funcionando. Qualquer pré-condição para o funcionamento deve ser registrada no README do projeto.
