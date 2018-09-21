# Creditario::Client

## Instalación

Solo añade a tu Gemfile:

    gem "creditario-client", git: "git@git.michelada.io:financial/creditario-client.git"

## Uso

### Ruby on Rails

#### 5.2+

Si utilizas Ruby on Rails en su versión 5.2, hay 2 cosas que debes hacer, la primera es:

    $ bundle exec rails g creditario:install

Y la segunda es editar tu archivo de credenciales, para añadir el *api_key* de tu Organización:

    $ EDITOR=vim bundle exec rails credentials:edit

Dentro de tu archivo de credenciales, debes agregar lo siguiente:

    creditario:
      development:
        api_key: BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe
      production:
        api_key: v48mbFLupTLWGvYnLVjDqaeEUJEYHmAM # Your production api_key

¡Listo! Ya tienes el cliente para la API de creditar.io totalmente configurado.

#### \< 5.2

En caso de que tu aplicación de Rails no utilice el archivo de credenciales, tal vez prefieras
utilizar **variables de entorno** para configurar el `api_key` y el `api_base` del cliente para
la API de creditar.io

Todo lo que tienes que hacer es ejecutar:

    $ bundle exec rails g creditario:install

Y actualizar el archivo `config/creditario.yml` que fue generado previamente:

    default: &default
      api_base: <%= ENV["CREDITARIO_API_URL"] || "http://localhost:3000" %>
      api_key: <%= ENV["CREDITARIO_API_KEY"] %>

Listo, ahora solamente deberás inicializar las variables de entorno para que el cliente sea configurado correctamente.

### Fuera de Rails

Si deseas usar la gema fuera de una aplicación de Rails. Justo después de requerirla en tu código debes configurar la `api_key` y la `api_base` a utilizar.

Esto lo puedes lograr con lo siguiente:

    Creditario::Client.api_key = "BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    Creditario::Client.api_base = "http://localhost:3000"

## Desarrollo

Recuerda que si necesitas hacer pruebas, deberás tener la API de creditar.io corriendo en tu máquina local o conectarte a la URL de staging.

Si estás haciendo pruebas locales, puedes especificar la URL y el puerto, gracias a la variable de entorno llamada: `CREDITARIO_API_URL`, usala antes de iniciar tus pruebas/desarrollo, ejemplo:

    $ CREDITARIO_API_URL=http://localhost:9000 bundle exec rails server

Por defecto, siempre intentará conectarse a `http://localhost:3000` si no se pasa la variable de entorno.

## Ejemplos

### Productos

Las operaciones que puedes realizar sobre Productos son: listar y obtener.

#### Listar todos los Productos activos

    result = Creditario::Products.list
    => Creditario::PaginatedCollection

    result.items
    => [Creditario::Product, Creditario::Product, ...]

#### Obtener un Producto

    Creditario::Products.retrieve("c005b7f7-a44a-4ec0-bf7f-73d15d806fd9")
    => Creditario::Product

### Clientes

Las operaciones que puedes realizar sobre Clientes son: listar, obtener, crear y actualizar.

#### Listar todos los Clientes

    result = Creditario::Customers.list
    => Creditario::PaginatedCollection

    result.items
    => [Creditario::Customer, Creditario::Customer, ...]

#### Obtener un Cliente

    Creditario::Customers.retrieve("2e9d05b8-2180-4779-bab6-bdfd41d1569f")
    => Creditario::Customer

#### Crear un Cliente

    result = Creditario::Customers.create(email: "karla@quieredinero.com", product_id: "c005b7f7-a44a-4ec0-bf7f-73d15d806fd9")
    => Creditario::Customer

#### Actualizar un Cliente

    result = Creditario::Customers.update("2e9d05b8-2180-4779-bab6-bdfd41d1569f", { email: "karina@necesitadinero.com" })
    => Creditario::Customer

### Solicitudes

Las operaciones que puedes realizar sobre Solicitudes son: listar, obtener, crear y actualizar.

#### Listar todas las Solicitudes

    result = Creditario::Applications.list
    => Creditario::PaginatedCollection

    result.items
    => [Creditario::Application, Creditario::Application, ...]

#### Obtener una Solicitud

    Creditario::Applications.retrieve("0b19e3b6-9fae-40e1-a7c2-f2db1cae8a5a")
    => Creditario::Application

#### Crear una Solicitud

    result = Creditario::Applications.create(customer_id: "2e9d05b8-2180-4779-bab6-bdfd41d1569f", product_id: "c005b7f7-a44a-4ec0-bf7f-73d15d806fd9")
    => Creditario::Application

#### Actualizar una Solicitud

    result = Creditario::Applications.update("c0324939-0802-41b2-b81e-04e8982270ec", { street: "Avenida Siempre Viva", exterior_number: "742" })
    => Creditario::Application

### Ingresos

Las operaciones que puedes realizar sobre Ingresos son: obtener, crear y eliminar.

#### Obtener un Ingreso

    Creditario::Incomes.retrieve("0b19e3b6-9fae-40e1-a7c2-f2db1cae8a5a")
    => Creditario::Income

#### Crear un Ingreso

    result = Creditario::Incomes.create(classification: "Trabajo", amount_cents: 45000, credit_application_id: "636264b1-77a2-45ef-b643-e44cfbc84d40")
    => Creditario::Income

#### Eliminar un Ingreso

    result = Creditario::Incomes.delete("0b19e3b6-9fae-40e1-a7c2-f2db1cae8a5a")
    => true

### Egresos

Las operaciones que puedes realizar sobre Egresos son: obtener, crear y eliminar.

#### Obtener un Egreso

    Creditario::Expenses.retrieve("eeedba2e-fc96-4f96-bd2e-bd046b256f96")
    => Creditario::Expense

#### Crear un Egreso

    result = Creditario::Expenses.create(classification: "Renta", amount_cents: 25000, credit_application_id: "636264b1-77a2-45ef-b643-e44cfbc84d40")
    => Creditario::Expense

#### Eliminar un Egreso

    result = Creditario::Expenses.delete("eeedba2e-fc96-4f96-bd2e-bd046b256f96")
    => true

### Referencias

Las operaciones que puedes realizar sobre Referencias son: obtener, crear y eliminar.

#### Obtener una Referencia

    Creditario::References.retrieve("0b19e3b6-9fae-40e1-a7c2-f2db1cae8a5a")
    => Creditario::Reference

#### Crear una Referencia

    result = Creditario::References.create(classification: "Amistad", name: "Diane Nguyen", phone: "3129743789", credit_application_id: "636264b1-77a2-45ef-b643-e44cfbc84d40")
    => Creditario::Reference

#### Eliminar una Referencia

    result = Creditario::References.delete("0b19e3b6-9fae-40e1-a7c2-f2db1cae8a5a")
    => true

### Catálogos

Las operaciones que puedes realizar sobre Catálogos son: listar y obtener.

#### Listar Catálogos disponibles

    result = Creditario::Catalogs.list
    => Creditario::ResourcesCollection

    result.items
    => [Creditario::Catalog, Creditario::Catalog, ...]

#### Obtener valores de un Catálogo

    Creditario::Catalog.retrieve(resource: "customer", field: "source")
    => Creditario::ResourcesCollection

### Estimaciones de Crédito

La operación que puedes realizar sobre Estimaciones de Crédito es: obtener.

#### Obtener una Estimación de Crédito

    result = Creditario::CreditEstimates.retrieve(nil, product_id: "c005b7f7-a44a-4ec0-bf7f-73d15d806fd9", amount_cents: "5000000", installments_number: "12")
    => Creditario::CreditEstimate
