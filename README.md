# E-Vader

### Pasos para su correcta ejecución:

* Tener instalado `Ruby` en tu computadora.
* Tener instalada la gema `Bundler`. Si no la tiene instalada, debe ejecutar `gem install bundler`.
* Clonar este repositorio: `git clone https://github.com/cristianbarbaro/trabajo_ruby_2015.git`.
* Acceder al directorio del repositorio: `cd trabajo_ruby_2015/src/e-vader`.
* Ejecutar el comando `bundle install` para instalar todas las dependencias (las gemas) para el correcto funcionamiento de la aplicación.
* Ejecutar las migraciones e instalar los datos de pruebas:
  * `bundle exec rake db:drop` (para asegurarnos que la base de datos está sin datos).
  * `bundle exec rake db:migrate` para correr las migraciones.
  * `bundle exec rake db:seed` para instalar los datos de pruebas del sistema.
* Iniciar un servidor con `bundle exec rails s` y acceder a `http://localhost:3000`.
  * Nota: si se está ejecutando en la máquina virtual que proporciona la cátedra (VagrantFile), entonces debe agregarse la opción `-b 10.10.10.10`. Esa es la ip de la red privada de la máquina virtual y es el punto de acceso a la misma.

### ¿Cómo funciona la aplicación?

* Los datos de nuestra aplicación se almacenan en bases de datos `SQLite`.  

#### Sobre los clientes:

* Al acceder al `index` de la aplicación se mostrará una lista con los clientes que realizan facturación. Desde allí usted puede ver información detallada, editar y eliminar un cliente.
* La información que se muestra es la solicitada en el enunciado del trabajo práctico.
* Además se cuenta con un botón que nos lleva a un listado con todas las facturas emitidas por el cliente en cuestión.
* Usted puede ver, editar y eliminar una factura desde ese listado.
* Si desea facturar a una persona y no está en la base de datos, debe agregarla desde el menú de _Personas_.
* Un cliente no puede ser eliminado si tiene facturas asociadas. Para eliminación del mismo, deben eliminarse sus facturas asociadas.

#### Sobre las facturas:

* Para acceder a las facturas de un cliente, debe hacerlo desde la vista que contiene la información del cliente. Desde allí, se puede acceder a un botón que nos mostrará todas las facturas para ese cliente.
* En dicho listado, se podrán ver, editar y eliminar las facturas.
* También podrá crearse una factura emitida por el cliente en el que nos encontremos.
* Cuando se crea una factura, por defecto su fecha de emisión es la del día en que fue creada pudiéndose modificar. También podrá editarse si es necesario.

#### Sobre las personas:

* Hay dos tipos de personas: físicas y jurídicas (entidades, empresas, etc.).
* Para eliminar a una persona, debe asegurarse de que no tiene facturas en las que esté facturado (en caso de que quiera eliminarlo, se mostrará un cartel avisándole sobre esta situación), de ser este el caso, debe eliminarse las facturas.

#### Sobre los tests:

* Hay una serie de tests que analizan la funcionalidad del sistema. Se cuenta con tests a algunos controladores y a modelos.
* Para correr todos los tests basta con ejecutar `bundle exec rake test`.
* Si se desea correr los tests para los modelos, se ejecuta `bundle exec rake test:models` (se testean los modelos de clientes y facturas), análogo si se desea correr los tests de los controladores: `bundle exec rake test:controllers` (están los tests para los controladores de los clientes, facturas y personas). Para ver más información mientras se corren los tests, le podemos enviar la opción `--verbose`.

#### Algunas cosas que deben tenerse en cuenta:

* Al crear un cliente, es obligatorio completar todos los campos y no se pueden almacenar si no tienen al menos un medio de contacto.
* Todos los campos son obligatorios en todos los formularios.
* Cuando se intenta llevar a cabo una operación inválida, se muestran mensajes de error. 
