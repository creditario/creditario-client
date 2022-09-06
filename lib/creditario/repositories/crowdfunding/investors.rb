# frozen_string_literal: true

module Creditario # :nodoc:
  module Crowdfunding # :nodoc:
    ###
    # == Creditario::Crowdfunding::Investors
    #
    # Repositorio de Inversionistas, permite realizar las siguientes operaciones
    # sobre Inversionistas de creditar.io
    #
    # - Obtener todos los Inversionistas:
    #
    #     result = Creditario::Crowdfunding::Investors.list
    #     => Creditario::PaginatedCollection
    #
    #     result.items
    #     => [Creditario::Crowdfunding::Investor, Creditario::Crowdfunding::Investor, ...]
    #
    # - Obtener un Inversionista en especifico:
    #
    #     Creditario::Crowdfunding::Investors.retrieve("2e9d05b8-2180-4779-bab6-bdfd41d1569f")
    #     => Creditario::Crowdfunding::Investor
    #
    # - Crear un Inversionista:
    #
    #     result = Creditario::Crowdfunding::Investors.create(email: "karla@quiereinvertir.com")
    #     => Creditario::Crowdfunding::Investor
    #
    module Investors
      extend Creditario::API::List
      extend Creditario::API::Retrieve
      extend Creditario::API::Create
      extend Creditario::API::Update

      ###
      # Path de la API donde se ejecutan las peticiones para Inversionistas.
      def self.resource_path
        "/crowdfunding/investors"
      end

      ###
      # Clase a utilizar para transformar las respuestas de la API
      def self.resource_class
        Creditario::Crowdfunding::Investor
      end
    end
  end
end
