# frozen_string_literal: true

module Creditario # :nodoc:
  module Crowdfunding # :nodoc:
    ###
    # == Creditario::Crowdfunding::Movements
    #
    # Repositorio de Movimientos del Inversionistas, permite realizar las siguientes operaciones
    # sobre Movimientos del Inversionistas de creditar.io
    #
    # - Obtener todos los Movimientos del Inversionistas:
    #
    #     result = Creditario::Crowdfunding::Movements.list
    #     => Creditario::PaginatedCollection
    #
    #     result.items
    #     => [Creditario::Crowdfunding::Movement, Creditario::Crowdfunding::Movement, ...]
    #
    # - Obtener un Movimientos del Inversionista en especifico:
    #
    #     Creditario::Crowdfunding::Movements.retrieve("2e9d05b8-2180-4779-bab6-bdfd41d1569f")
    #     => Creditario::Crowdfunding::Movement
    #
    # - Crear un Movimientos del Inversionista:
    #
    #     result = Creditario::Crowdfunding::Movements.create(amount_cents: 100000, ..., investor_id: "a7454cdb-c695-4db0-9df7-edf87944404d")
    #     => Creditario::Crowdfunding::Movement
    #
    module Movements
      extend Creditario::API::List
      extend Creditario::API::Retrieve
      extend Creditario::API::Create

      ###
      # Path de la API donde se ejecutan las peticiones para Movimientos del Inversionistas.
      def self.resource_path
        "/crowdfunding/movements"
      end

      ###
      # Clase a utilizar para transformar las respuestas de la API
      def self.resource_class
        Creditario::Crowdfunding::Movement
      end
    end
  end
end
