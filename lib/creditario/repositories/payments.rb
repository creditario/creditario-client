# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Payments
  #
  # Repositorio de Pagos, permite obtener la lista de Pagos a partir de un Crédito.
  #
  # - Listar Pagos por Crédito:
  #
  #     Creditario::Payments.list(credit_id: "2e9d05b8-2180-4779-bab6-bdfd41d1569f")
  #     => Creditario::ResourcesCollection
  #
  # - Crear un Pago:
  #
  #     Creditario::Payments.create(installment_id: "9270cc36-5f90-448a-8fd8-cff7c7bd1f75", amount_cents: 100000, payment_type: "annuity", prepaid_type: "not_reduce", payment_method: "SPEI", forgive_penalty_interest: "false")
  #     => Creditario::Payment
  module Payments
    extend Creditario::API::List
    extend Creditario::API::Create

    ###
    # Path de la API donde se ejecutan las peticiones para Pagos.
    def self.resource_path
      "/payments"
    end

    ###
    # Clase a utilizar para transformar las respuestas de la API
    def self.resource_class
      Creditario::Payment
    end
  end
end
