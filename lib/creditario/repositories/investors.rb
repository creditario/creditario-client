# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Investors
  #
  # Repositorio de Inversionistas, permite realizar las siguientes operaciones
  # sobre Inversionistas de creditar.io
  #
  # - Obtener todos los Inversionistas:
  #
  #     result = Creditario::Investors.list
  #     => Creditario::PaginatedCollection
  #
  #     result.items
  #     => [Creditario::Investor, Creditario::Investor, ...]
  #
  # - Obtener un Inversionista en especifico:
  #
  #     Creditario::Investors.retrieve("2e9d05b8-2180-4779-bab6-bdfd41d1569f")
  #     => Creditario::Investor
  #
  # - Crear un Inversionista:
  #
  #     result = Creditario::Investors.create(email: "karla@quiereinvertir.com")
  #     => Creditario::Investor
  #
  module Investors
    extend Creditario::API::List
    extend Creditario::API::Retrieve
    extend Creditario::API::Create

    ###
    # Path de la API donde se ejecutan las peticiones para Inversionistas.
    def self.resource_path
      "/crowdfunding/investors"
    end

    ###
    # Clase a utilizar para transformar las respuestas de la API
    def self.resource_class
      Creditario::Investor
    end
  end
end
