# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::ConvertApplicationToCredits
  #
  # Repositorio para Convertir Solicitud a Crédito, permite convertir una Solicitud a Crédito.
  #
  # - Crea para Convertir una Solicitud a Crédito:
  #
  #     Creditario::ConvertApplicationToCredits.create(credit_application_id: "2e9d05b8-2180-4779-bab6-bdfd41d1569f", accepted_at: "2020-05-01", first_payment_date: "2020-05-02", closing_date_at: "2020-05-04", payment_days: 20)
  #     => Creditario::Credit
  #
  module ConvertApplicationToCredits
    extend Creditario::API::Create

    ###
    # Path de la API donde se ejecutan las peticiones para Convertir Solicitud a Crédito.
    def self.resource_path
      "/convert_application_to_credits"
    end

    ###
    # Clase a utilizar para transformar las respuestas de la API
    def self.resource_class
      Creditario::Credit
    end
  end
end
