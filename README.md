# Desafio Ruby on Rails

Foi desenvolvido uma aplicação em ruby on rails baseado em um sistema administrativo para lojas(marketplace),
utilizando as seguintes ferramentas:

### FERRAMNETAS UTILIZADAS

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

### FERRAMENTA PARA DEPLOY
* [Heroku](https://www.heroku.com/)
  - Heroku addons [Cloudinary](https://elements.heroku.com/addons/cloudinary)
  - Heroku addons [Mlab - MongoDB](https://elements.heroku.com/addons/mongolab)

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


Após a configuração rode o comando para gerar o usuário administrador:

* Gerar usuário:
```sh
rails setup:create_admin

email: admin@admin.com
password: 123456789
```

Agora Pronto , Qualquer dúvida Tamo junto, Bons Estudos!

-----------------------------------------------------------

Autor: Alef Ojeda de Oliveira

Email: nemubatubag@gmail.com

Facebook: https://www.facebook.com/AlefOjedaOliveira/

Github: https://github.com/nemuba

Linkedin: https://www.linkedin.com/in/alef-ojeda/

Twitter: https://twitter.com/OjedaAlef