# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Applications
  #
  # Repositorio de Aplicaciones de Crédito, permite realizar las siguientes operaciones
  # sobre Aplicaciones de Crédito de creditar.io
  #
  # - Obtener todas las Aplicaciones:
  #
  #     result = Creditario::Applications.list
  #     => Creditario::PaginatedCollection
  #
  #     result.items
  #     => [Creditario::Application, Creditario::Application, ...]
  #
  # - Obtener una Aplicación en especifico:
  #
  #     Creditario::Applications.retrieve("0b19e3b6-9fae-40e1-a7c2-f2db1cae8a5a")
  #     => Creditario::Application
  module Applications
    extend Creditario::API::List
    extend Creditario::API::Retrieve

    ###
    # Path de la API donde se ejecutan las peticiones para Aplicaciones.
    def self.resource_path
      "/applications"
    end

    ###
    # Clase a utilizar para transformar las respuestas de la API.
    def self.resource_class
      Creditario::Application
    end
  end
end
