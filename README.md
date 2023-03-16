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

Qualquer dúvida só entrar em contato.
