# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::ConvertApplicationToCredit
  #
  # Repositorio de Créditos, permite obtener la lista de Créditos a partir de un Cliente
  # así como obtener un Crédito a partir de su ID.
  #
  # - Listar Créditos por Cliente:
  #
  #     Creditario::Credits.list(customer_id: "2e9d05b8-2180-4779-bab6-bdfd41d1569f")
  #     => Creditario::ResourcesCollection
  #
  # - Obtener un Crédito:
  #
  #     Creditario::Credits.retrieve("636264b1-dc0d-453e-8804-4ac451e1dbd5")
  #     => Creditario::Credit
  module ConvertApplicationToCredits
    extend Creditario::API::Create

    ###
    # Path de la API donde se ejecutan las peticiones para Créditos.
    def self.resource_path
      "/convert_application_to_credits"
    end

    ###
    # Clase a utilizar para transformar las respuestas de la API
    def self.resource_class
      Creditario::ConvertApplicationToCredit
    end
  end
end
