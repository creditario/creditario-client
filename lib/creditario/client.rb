# frozen_string_literal: true

require "oj"

require "creditario/client/version"
require "creditario/client/railtie" if defined?(Rails)

require "creditario/exceptions"

require "creditario/api/request"
require "creditario/api/create"
require "creditario/api/multipart"
require "creditario/api/delete"
require "creditario/api/list"
require "creditario/api/retrieve"
require "creditario/api/update"

require "creditario/utils/paginated_collection"
require "creditario/utils/resources_collection"

require "creditario/resources/resource"
require "creditario/resources/product"
require "creditario/resources/credit_estimate"
require "creditario/resources/contract"
require "creditario/resources/expense"
require "creditario/resources/income"
require "creditario/resources/reference"
require "creditario/resources/application"
require "creditario/resources/customer"
require "creditario/resources/catalog"
require "creditario/resources/attachment"
require "creditario/resources/credit"
require "creditario/resources/payment"
require "creditario/resources/movement"
require "creditario/resources/qualify_score_flow"
require "creditario/resources/investor"

require "creditario/repositories/applications"
require "creditario/repositories/customers"
require "creditario/repositories/products"
require "creditario/repositories/credit_estimates"
require "creditario/repositories/contracts"
require "creditario/repositories/catalogs"
require "creditario/repositories/incomes"
require "creditario/repositories/expenses"
require "creditario/repositories/references"
require "creditario/repositories/attachments"
require "creditario/repositories/credits"
require "creditario/repositories/payments"
require "creditario/repositories/movements"
require "creditario/repositories/qualify_score_flows"
require "creditario/repositories/convert_application_to_credits"
require "creditario/repositories/investors"

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

    ###
    # Modo entorno de pruebas (Sandbox) por default es false
    @sandbox = false

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
      # Útil cuando se desea utilizar el ambiente de *staging* por ejemplo.
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
      # Modo entorno de pruebas (Sandbox)
      #
      # Útil cuando se desea obtener datos de entorno de pruebas.
      #
      # Por default es false
      attr_accessor :sandbox

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
      # Método de acesso al repositorio de Contratos.
      #
      # Para más información, puedes consultrar la documentación de Creditario::Contracts
      def contracts
        Creditario::Contracts
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

      ###
      # Método de acceso al repositorio de Archivos.
      #
      # Para más información, puede consultar la documentación de Creditario::Attachments
      def attachments
        Creditario::Attachments
      end

      ###
      # Método de acceso al repositorio de Estimaciones de Crédito
      #
      # Para más información, puede consultar la documentación de Creditario::CreditEstimates
      def credit_estimates
        Creditario::CreditEstimates
      end

      ###
      # Método de acceso al repositorio de Créditos
      #
      # Para más información, puede consultar la documentación de Creditario::Credits
      def credits
        Creditario::Credits
      end

      ###
      # Método de acceso al repositorio de Pagos
      #
      # Para más información, puede consultar la documentación de Creditario::Payments
      def payments
        Creditario::Payments
      end

      ###
      # Método de acceso al repositorio de Movimientos
      #
      # Para más información, puede consultar la documentación de Creditario::Movements
      def payments
        Creditario::Movements
      end

      ###
      # Método de acceso al repositorio de Calificaciones de flujos de calificación
      #
      # Para más información, puede consultar la documentación de Creditario::QualifyScoreFlows
      def qualify_score_flows
        Creditario::QualifyScoreFlows
      end

      ###
      # Método de acceso al repositorio de Convertir una Solicitud en Crédito
      #
      # Para más información, puede consultar la documentación de Creditario::ConvertApplicationToCredits
      def convert_application_to_credits
        Creditario::ConvertApplicationToCredits
      end
    end
  end
end
