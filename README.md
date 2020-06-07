# Desafio Ruby on Rails

<p align="center">
  <img src="https://github.com/nemuba/desafio-ruby-on-rails/blob/master/focused_working_isometric.png" width="350" title="hover text" />
</p>

Foi desenvolvido uma aplicação em ruby on rails baseado em um sistema administrativo para lojas(marketplace),
utilizando as seguintes ferramentas:

### FERRAMENTAS UTILIZADAS:

* [Rails Admin - Gem](https://github.com/sferik/rails_admin)
* [Devise - Gem](https://github.com/heartcombo/devise)
* [Cloudinary - Gem](https://github.com/cloudinary/cloudinary_gem)
* [Carrierwave - Gem](https://github.com/carrierwaveuploader/carrierwave)
* [Carrierwave Base64 - Gem](https://github.com/y9v/carrierwave-base64)
* [Carrierwave Mongoid - Gem](https://github.com/carrierwaveuploader/carrierwave-mongoid)
* [Mongoid - Gem](https://github.com/mongodb/mongoid)
* [Cancancan - Gem](https://github.com/CanCanCommunity/cancancan)
* [Cancancan Mongoid - Gem](https://github.com/CanCanCommunity/cancancan-mongoid)
* [Bootstrap - Gem](https://github.com/twbs/bootstrap-rubygem)
* [Kaminari Mongoid - Gem](https://github.com/kaminari/kaminari-mongoid)
* [Searchkick - Gem](https://github.com/ankane/searchkick)
* [Down - gem](https://github.com/janko/down)
* [TTY-Spinner - gem](https://github.com/piotrmurach/tty-spinner)

### FERRAMENTA PARA DEPLOY:
* [Heroku](https://www.heroku.com/)
  - Heroku addons [Cloudinary](https://elements.heroku.com/addons/cloudinary)
  - Heroku addons [Mlab - MongoDB](https://elements.heroku.com/addons/mongolab)
  - Heroku addons [Bonsai - ElasticSearch](https://elements.heroku.com/addons/bonsai)
  - Heroku addons [Mailgun](https://elements.heroku.com/addons/mailgun)

### CONFIGURAÇÕES:

Baixe o projeto e rode o comando para instalar as gems:

```sh
bundle install
```

Coloque as configuraçẽs do mongo e do cloudinary:

* Arquivo de configuração do Mongo:
```sh
config/mongoid.yml
```

* Arquivo de Configuração do Clodinary:
```sh
config/cloudinary.yml
```

* Arquivo de Configuração do Elasticsearch(se necessário):
```sh
config/eleasticsearch.rb
```

* Configurar envio de email de recuperação de senha para o devise:
```sh
config/environments/development.rb -> Desenvolvimento

config/environments/production.rb -> Produção
```

Após a configuração rode o comando para gerar o usuário administrador:

* Gerar usuário Admin:
```sh
rails setup:create_admin

email: admin@admin.com
password: 123456789
```

* Gerar 3 lojas fakes: Fossil, Timex e Schumman

```sh
rails setup:create_stores
```

* Buscar produtos da API disponibilizada para desafio

```sh
rails setup:load_products
```
Agora Pronto , Qualquer dúvida Tamo junto, Bons Estudos!

-----------------------------------------------------------

Autor: Alef Ojeda de Oliveira

Email: nemubatubag@gmail.com

Facebook: https://www.facebook.com/AlefOjedaOliveira/

Github: https://github.com/nemuba

Linkedin: https://www.linkedin.com/in/alef-ojeda/

Twitter: https://twitter.com/OjedaAlef
