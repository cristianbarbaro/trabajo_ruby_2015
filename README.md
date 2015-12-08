# E-Vader

### Pasos para su correcta ejecución:

* Tener instalado `Ruby` en tu computadora (obviamente).
* Tener instalada la gema `Bundler`. Si no la tiene instalada, debe ejecutar `gem install bundler`.
* Clonar este repositorio: `git clone https://github.com/cristianbarbaro/trabajo_ruby_2015.git`.
* Acceder al directorio del repositorio: `cd trabajo_ruby_2015/src/e-vader`.
* Ejecutar el comando `bundle install` para instalar todas las dependencias (las gemas) para el correcto funcionamiento de Rails.
* Ejecutar las migraciones e instalar los datos de pruebas:
  * `bundle exec rake db:drop` (para asegurarnos que la base de datos está sin datos).
  * `bundle exec rake db:migrate` para correr las migraciones.
  * `bundle exec rake db:seed` para instalar los datos de pruebas del sistema.
* Iniciar un servidor con `bundle exec rails s` y acceder a `http://localhost:3000`.

### ¿Cómo funciona la aplicación?

#### Sobre los clientes:

* Al acceder al `index` de la aplicación se mostrará una lista con los clientes que realizan facturación. Desde allí usted puede ver información detallada, editar y eliminar un cliente.
 * La información que se muestra es la solicitada en el enunciado del trabajo práctico.
 * Además se cuenta con un botón que nos lleva a un listado con todas las facturas emitidas por el cliente en cuestión.
 * Usted puede ver, editar y eliminar una factura.

#### Sobre las personas:

* Para ver las personas a las que se les emite facturas, debe accederse a la ruta `/people`.
* Allí se listan las personas y se cuenta con la opción de `Ver`, `Editar` y `Eliminar` a una persona.
* También hay un botón para agregar una persona.

#### Sobre los tipos de contactos:

* Para ver una lista de todos los tipos de contactos disponibles y agregar, ver, editar y eliminar un tipo de contacto, debe acceder a la ruta `/contacts`.
* Cada vez que desee agregar información de contacto y no cuente con el tipo de contacto, debe acceder a la ruta `/contacts/new` y agregarla a la base de datos.

#### Sobre las facturas:

* Para listar todas las facturas (sin tener en cuenta si es de un cliente en particular, se listan todas) debe acceder a `/invoices`. Allí cuenta con las opciones para agregar, ver, editar y eliminar facturas.
* Si lo que desea es ver las facturas de un cliente en particular, debe acceder desde la opción desde `Clientes`.
