# frozen_string_literal: true

module Creditario # :nodoc:
  module Crowdfunding # :nodoc:
    ###
    # == Creditario::Crowdfunding::Contracts
    #
    # Repositorio de Contracto del Inversionistas, permite realizar las siguientes operaciones
    # sobre Contracto del Inversionistas de creditar.io
    #
    # - Obtener un Contracto del Inversionista en especifico:
    #
    #     Creditario::Crowdfunding::Contracts.retrieve("2e9d05b8-2180-4779-bab6-bdfd41d1569f")
    #     => Creditario::Crowdfunding::Contract
    #
    module Contracts
      extend Creditario::API::Retrieve

      ###
      # Path de la API donde se ejecutan las peticiones para Contracto del Inversionistas.
      def self.resource_path
        "/crowdfunding/investor_contracts"
      end

      ###
      # Clase a utilizar para transformar las respuestas de la API
      def self.resource_class
        Creditario::Crowdfunding::Contract
      end
    end
  end
end
