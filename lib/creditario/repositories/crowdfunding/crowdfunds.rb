# frozen_string_literal: true

module Creditario # :nodoc:
  module Crowdfunding # :nodoc:
    ###
    # == Creditario::Crowdfunding::Crowdfunds
    #
    # Repositorio de Campañas de fondos, permite realizar las siguientes operaciones
    # sobre Campañas de fondos de creditar.io
    #
    # - Obtener todas las Campañas de fondos:
    #
    #     result = Creditario::Crowdfunding::Crowdfunds.list
    #     => Creditario::PaginatedCollection
    #
    #     result.items
    #     => [Creditario::Crowdfunding::Crowdfund, Creditario::Crowdfunding::Crowdfund, ...]
    #
    # - Obtener una Campaña de fondos en especifico:
    #
    #     Creditario::Crowdfunding::Crowdfunds.retrieve("2e9d05b8-2180-4779-bab6-bdfd41d1569f")
    #     => Creditario::Crowdfunding::Crowdfund
    #
    # - Crear una Campaña de fondos:
    #
    #     result = Creditario::Crowdfunding::Crowdfunds.create(amount_cents: 100000000, ... ,campaing_days: 30)
    #     => Creditario::Crowdfunding::Crowdfund
    #
    module Crowdfunds
      extend Creditario::API::List
      extend Creditario::API::Retrieve
      extend Creditario::API::Create

      ###
      # Path de la API donde se ejecutan las peticiones para campañas de fondos.
      def self.resource_path
        "/crowdfunding/crowdfunds"
      end

      ###
      # Clase a utilizar para transformar las respuestas de la API
      def self.resource_class
        Creditario::Crowdfunding::Crowdfund
      end
    end
  end
end
