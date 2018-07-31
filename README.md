# plannings_cinema
This is a refactoring application of plannings_ecranvillage.
## Plannings projections et caisse pour un cinéma itinérant.
* Planning pour organiser les séances de bénévoles (projectionnistes, caisse) dans un cinéma itinérant d'Arts et d'Essais avec plusieurs lieux de diffusion éditable en Ruby on Rails.
* Le but en de faire un outil de plannification à travers un agenda avec des tâches configurable et éditable pour les utilisateurs.
* Sentez-vous libre d'adapter ce projet si il vous intéresse.

* Vous pouvez aussi trouver cette application sur [Framagit](https://git.framasoft.org/rodinux/plannings_ecranvillage).
J'y ai ajouté un [Wiki](https://git.framasoft.org/rodinux/plannings_ecranvillage/wikis/home) pour bien documenter cette application et comprendre ainsi comment l'adapter, si vous le désirez, à un de vos projets.

## Plannings for a mobile cinema with voluntary workers.
* This application have been developed for an mobile cinema to organise the voluntary workers for the showings and the cashier for each shows. Since we've got numeric projectors, the activity have consequently increase and we needed a tool to make easier the task of the plannings.
* Actually, the application is on production [here](https://plannings-cinema.herokuapp.com/) on an Heroku's server because it's a simple way to deploy an Ruby on Rails application.
As it's also deployed on another server for the management of our Plannings, this adress o Heroku is now a demo application. You can be free to try it if you want. To try it, you can login [here](https://plannings-cinema.herokuapp.com/log_in) and to get connected, put this email : manager@demo.com and this password : manager to be connected as a 'manager' like the voluntary workers or with this email : admin@demo.com and this password : admin to be connected as an administrator. Be respectful, I open this application by my own risk to let interested people discover how it works.

## Installation Ruby on Rails with rvm and dependencies :
* Ruby version : ruby 2.4.1

* You need to install ruby and ruby on rails or rvm is a better solution.
To get rvm add some dependencies (on a GNU/linux OS):

```
$ sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
```
Have a look on this link to do it (don't forget to have a look if you already have an ruby version installed on your system, in that case you will need to remove it before !) : see [rvm](https://rvm.io/rvm/install).

* To get ruby 2.4.1 :

```bash
$ rvm install 2.4.1
```

* Then to get rails only add this on your bash (this will install a newest stable version of rails, for this project you need another version, see later) :

```bash
$ gem install rails
```
 and

```bash
$ sudo apt-get install libpq-dev
```

## Installation:

* To configure the application, you can clone it, run
```bash
$ git clone https://github.com/rodinux/plannings_ecranvillage.git
```
or fork it , as you want.

* To use ruby 2.4.1, don't forget doing this in your project :
```bash
$ cd plannings_cinema
$ rvm use 2.4.1
$ gem install rails
```

* Then run
```bash
$ bundle install
```

* IMPORTANT: You need also to create this file in the folder config (this file is include in .gitignore to hide the production environnement's secret key) :

### config/secrets.yml

```
# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rails secret` to generate a secure secret key.

# Make sure the secrets in this file are kept private
# if you're sharing your code publicly.

development:
  secret_key_base: 2ca52b6802d2b58b6c960a4533200e8c709640412aa7c85fd4d15795784a874becfcadfe6db8b7d5b131edc10b8ffeda5966b40dcd7756dd443b0198d7594168

test:
  secret_key_base: 4e6b13a56a8e4184391d054d3a67d763025c3b5e17cddb3782038e33c20b360128bca92a229824fb300d5019c203358a6d29d94953ac9b8bc596eaa4543bd53a

# Do not keep production secrets in the repository,
# instead read values from the environment.
production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>

# is it visible this second time ??
```


## Deployment instructions

* It is possible you want to change the database, (I personnally use postgresql), if you want to use it without Postgresql and without creating first a database, it is very easy. You need to make few changes, in the file config/database.yml, replace all by :

## config/database.yml

```
# SQLite version 3.x
#   gem install sqlite3-ruby (not necessary on OS X Leopard)
development:
  adapter: sqlite3
  database: db/development.sqlite3
  pool: 5
  timeout: 5000

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  adapter: sqlite3
  database: db/test.sqlite3
  pool: 5
  timeout: 5000

production:
  adapter: sqlite3
  database: db/production.sqlite3
  pool: 5
  timeout: 5000
```

* You always need to migrate the database before running :

```
$ rake db:create
$ rake db:migrate
```

* To sart the application locally :

```
$ rails s
```

That's all :)

## More Information

* You can found this application on [Framagit](https://git.framasoft.org/rodinux/plannings_ecranvillage) or on [Github](https://github.com/rodinux/plannings_cinema).
I have added a [Wiki](https://git.framasoft.org/rodinux/plannings_ecranvillage/wikis/home) on Framagit to get documentation if you want to adapt this project.

## Deploying on heroku

* In heroku you need to keep the file config/database.yml configured with pgsql and to have the gem 'pg' on your file Gemfile.

* To get ruby 2.4.1 :

```
$ rvm install 2.4.1
```

* To use ruby 2.4.1 don't forget doing this in your project :

```
$ cd plannings_cinema
$ rvm use 2.4.1
$ gem install rails
```
Then run

```
$ bundle install
```

* to use wicked_pdf on heroku you need to change few things, add the gem wkhtmltopdf-heroku in the group production

```
group :production do
  gem 'pg', group: :production
  gem 'rails_12factor', group: :production
  gem 'wkhtmltopdf-heroku', group: :production
end
```

* Don't put anything in config/initializers/mimes_types.rb or just comment it

* also in config/environnements/production.rb, comment or erase this line :

```
config.after_initialize do
    WICKED_PDF[:exe_path] = "/usr/bin/wkhtmltopdf.sh"
  end
```

* in config/initialers/wicked_pdf.rb

```
if Rails.env.staging? || Rails.env.production?
  exe_path = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s
else
  exe_path = Rails.root.join('bin', 'wkhtmltopdf').to_s
end
```

* Have a look at : [Wicked_pdf Configuration](https://github.com/mileszs/wicked_pdf/wiki/Configuration) and [Wicked_pdf RubyDoc](http://www.rubydoc.info/gems/wicked_pdf/0.7.2)

Have fun, <3 Ruby on Rails


