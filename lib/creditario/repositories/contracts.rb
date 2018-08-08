# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Contracts
  #
  # Repositorio de Contratos, permite realizar las siguientes operaciones
  # sobre Contratos de creditar.io:
  #
  # - Obtener un Contrato en especifico:
  #
  #     Creditario::Contracts.retrieve("c005b7f7-a44a-4ec0-bf7f-73d15d806fd9")
  #     => Creditario::Contract
  module Contracts
    extend Creditario::API::Retrieve

    ###
    # Path de la API donde se ejecutan las peticiones para Contratos.
    def self.resource_path
      "/contracts"
    end

    ###
    # Clase a utilizar para transformar las respuestas de la API.
    def self.resource_class
      Creditario::Contract
    end
  end
end
