# frozen_string_literal: true

require "oj"

require "creditario/client/version"
require "creditario/client/railtie" if defined?(Rails)

require "creditario/exceptions"

require "creditario/api/request"
require "creditario/api/create"
require "creditario/api/delete"
require "creditario/api/list"
require "creditario/api/retrieve"
require "creditario/api/update"

require "creditario/utils/paginated_collection"
require "creditario/utils/resources_collection"

require "creditario/resources/resource"
require "creditario/resources/product"
require "creditario/resources/expense"
require "creditario/resources/income"
require "creditario/resources/reference"
require "creditario/resources/application"
require "creditario/resources/customer"
require "creditario/resources/catalog"

require "creditario/repositories/applications"
require "creditario/repositories/customers"
require "creditario/repositories/products"
require "creditario/repositories/catalogs"
require "creditario/repositories/incomes"
require "creditario/repositories/expenses"
require "creditario/repositories/references"

module Creditario # :nodoc:
  ###
  # == Creditario::Client
  # Modulo que será utilizado para consumir la API de creditar.io
  module Client
    ###
    # URL al ambiente de *production* de la API de creditar.io
    @api_base = "https://www.creditar.io"

    ###
    # Version a utilizar de la API de creditar.io
    @api_version = 1

    class << self
      ###
      # La API Key es necesaria para cualquier interacción con la API de creditar.io
      #
      # Después de requerir la gema, lo más recomendado es definir la API Key a
      # utilizar en todas las llamadas a la API.
      #
      # ==== Ejemplo
      #   Creditario::Client.api_key = "BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
      attr_accessor :api_key

      ###
      # URL en la cual se ejecutarán las interacciones con la API de creditar.io
      #
      # Util cuando se desea utilizar el ambiente de *staging* por ejemplo.
      #
      # ==== Ejemplo
      #
      #  Creditario::Client.api_base = "https://staging.creditar.io"
      attr_accessor :api_base

      ###
      # Versión a utilizar de la API de creditar.io
      # Por default es 1
      attr_accessor :api_version

      ###
      # Método de acceso al repositorio de Productos.
      #
      # Para más información, puedes consultar la documentación de Creditario::Products
      def products
        Creditario::Products
      end

      ###
      # Método de acceso al repositorio de Clientes.
      #
      # Para más información, puedes consultar la documentación de Creditario::Customers
      def customers
        Creditario::Customers
      end

      ###
      # Método de acceso al repositorio de Solicitudes.
      #
      # Para más información, puedes consultar la documentación de Creditario::Applications
      def applications
        Creditario::Applications
      end

      ###
      # Método de acceso al repositorio de Catálogos.
      #
      # Para más información, puedes consultar la documentación de Creditario::Catalogs
      def catalogs
        Creditario::Catalogs
      end

      # Método de acceso al repositorio de Ingresos.
      #
      # Para más información, puedes consultar la documentación de Creditario::Incomes
      def incomes
        Creditario::Incomes
      end

      ###
      # Método de acceso al repositorio de Egresos.
      #
      # Para más información, puedes consultar la documentación de Creditario::Expenses
      def expenses
        Creditario::Expenses
      end

      ###
      # Método de acceso al repositorio de Referencias.
      #
      # Para más información, puedes consultar la documentación de Creditario::References
      def references
        Creditario::References
      end
    end
  end
end
