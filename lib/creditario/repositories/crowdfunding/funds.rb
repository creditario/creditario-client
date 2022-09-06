# frozen_string_literal: true

module Creditario # :nodoc:
  module Crowdfunding # :nodoc:
    ###
    # == Creditario::Crowdfunding::Funds
    #
    # Repositorio de Fondos, permite realizar las siguientes operaciones
    # sobre Fondos de creditar.io
    #
    # - Obtener todos los Fondos:
    #
    #     result = Creditario::Crowdfunding::Funds.list
    #     => Creditario::PaginatedCollection
    #
    #     result.items
    #     => [Creditario::Crowdfunding::Fund, Creditario::Crowdfunding::Fund, ...]
    #
    # - Obtener un Fondo en especifico:
    #
    #     Creditario::Crowdfunding::Funds.retrieve("2e9d05b8-2180-4779-bab6-bdfd41d1569f")
    #     => Creditario::Crowdfunding::Fund
    #
    # - Crear un Fondo:
    #
    #     result = Creditario::Crowdfunding::Funds.create(amount_cents: 1000000, ..., crowdfund_id: "fef6ced1-a462-4d78-af50-70528eb2986b")
    #     => Creditario::Crowdfunding::Fund
    #
    module Funds
      extend Creditario::API::List
      extend Creditario::API::Retrieve
      extend Creditario::API::Create

      ###
      # Path de la API donde se ejecutan las peticiones para Fondos.
      def self.resource_path
        "/crowdfunding/funds"
      end

      ###
      # Clase a utilizar para transformar las respuestas de la API
      def self.resource_class
        Creditario::Crowdfunding::Fund
      end
    end
  end
end
