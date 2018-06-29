# frozen_string_literal: true

require "oj"

module Creditario # :nodoc:
  autoload :Version, ".lib/creditario/version"
  autoload :Exceptions, "./lib/creditario/exceptions"
  autoload :API, "./lib/creditario/api"
  autoload :Resource, "./lib/creditario/resources/resource"
  autoload :Customer, "./lib/creditario/resources/customer"
  autoload :Customers, "./lib/creditario/repositories/customers"
  autoload :CreditApplication, "./lib/creditario/resources/credit_application"
  autoload :Product, "./lib/creditario/resources/product"
  autoload :Products, "./lib/creditario/repositories/products"
  autoload :PaginatedCollection, "./lib/creditario/utils/paginated_collection"

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
      # Para más información, puedes consultar la documentación de Creditario::Products
      def products
        Creditario::Products
      end

      ###
      # Método de acceso al repositorio de Clientes.
      # Para más información, puedes consultar la documentación de Creditario::Customers
      def customers
        Creditario::Customers
      end
    end
  end
end
