# E-Vader

### Pasos para su correcta ejecución:

* Tener instalada la gema `Bundler`. Si no la tiene instalada, debe ejecutar `gem install bundler`.
* Clonar este repositorio: `git clone https://github.com/cristianbarbaro/trabajo_ruby_2015.git`.
* Acceder al directorio del repositorio: `cd trabajo_ruby_2015/src/e-vader` o como le hayas puesto de nombre al directorio.
* Ejecutar el comando `bundle install` para instalar todas las dependencias para el correcto funcionamiento de Rails.
* Ejecutar las migraciones e instalar los datos de pruebas:
  * `bundle exec rake db:drop` (para asegurarnos que la base de datos está sin datos).
  * `bundle exec rake db:migrate` para correr las migraciones.
  * `bundle exec rake db:seed` para instalar los datos de pruebas del sistema.
* Iniciar un servidor con `bundle exec rails s` y acceder a `http://localhost:3000`.
