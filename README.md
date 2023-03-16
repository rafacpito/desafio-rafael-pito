# desafio-rafael-pito
Desafio Ruby on Rails feito para empresa OM30.

# Produção
Link da aplicação em desenvolvimento: https://desafio-rafael-pito.herokuapp.com

As fotos, algumas estão quebrando, outras funcionando

# Desenvolvimento
Caso queira rodar a aplicação em desenvolvimento(necessario ter o docker e docker-compose na maquina):
- Clonar a aplicação entrar na pasta dela e rodar o seguinte comando:
```sh
docker-compose build
```
- Apos buildar, é necessario subir o docker-compose:
```sh
docker-compose up
```
- Após subir o docker, entrar nele com o comando:
```sh
docker exec -it desafio-rafael-pito_web_1 bash
```
- e subir as migrations com o comando:
```sh
rails db:migrate
```

Após isso, acessar o localhost:3000 e o sistema já esta pronto para utilização.

# Testes
Caso queira rodar os testes feitos da aplicação:
- Acessar o docker com o comando:
```sh
docker exec -it desafio-rafael-pito_web_1 bash
```
- Criar o banco de dados de teste:
```sh
rails db:create RAILS_ENV=test
```
- e subir as migrations com o comando:
```sh
rails db:migrate RAILS_ENV=test
```
- e após isso é so rodar os testes:
```sh
rspec spec
```

# Ferramentas

Lista de algumas ferramentas utilizadas:
- Utilizado o docker e docker-compose para criar ambiente de desenvolvimento;
- Maioria dos arquivos e mais necessarios testados com rspec;
- Twilio para envio de sms;
- Para email foi utilizado o proprio ActionMailer do Rails;
- ActionView para fazer o front, Bootstrap para estilizar, Jquery com a gem jquery_mask_rails para fazer as mascaras de CPF, CNS, CEP e telefone;
- Gem email_validator e cpf_cnpj para validação de e_mail e cpf, respectivamente;
- Carrierwave para upload da foto do munícipe;
- Will Paginate para listagem paginada(munícipes mostrados por pagina é 5, possível alterar mandando per_page na url);
- Ransack para filtrar a listagem;
- FactoryBot, Faker, Shoulda Matchers para auxiliar nos testes via rspec.

Qualquer dúvida só entrar em contato.
