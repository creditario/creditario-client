# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Estimates
  #
  # Repositorio de Estimaciones de Crédito, permite obtener una Estimación de Crédito
  # en base a un Producto de creditar.io:
  #
  # - Obtener una Estimación:
  #
  #     Creditario::Estimates.retrieve(nil, product_id: "c005b7f7-a44a-4ec0-bf7f-73d15d806fd9", amount_cents: 1000000, installments_number: 12)
  #     => Creditario::CreditEstimate
  module CreditEstimates
    extend Creditario::API::Retrieve

    ###
    # Path de la API donde se ejecutan las peticiones para Estimaciones.
    def self.resource_path
      "/credit_estimates"
    end

    ###
    # Clase a utilizar para transformar las respuestas de la API.
    def self.resource_class
      Creditario::CreditEstimate
    end
  end
end
