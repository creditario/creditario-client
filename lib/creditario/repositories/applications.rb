# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Applications
  #
  # Repositorio de Solicitudes de Crédito, permite realizar las siguientes operaciones
  # sobre Solicitudes de Crédito de creditar.io
  #
  # - Obtener todas las Solicitudes:
  #
  #     result = Creditario::Applications.list
  #     => Creditario::PaginatedCollection
  #
  #     result.items
  #     => [Creditario::Application, Creditario::Application, ...]
  #
  # - Obtener una Solicitud en especifico:
  #
  #     Creditario::Applications.retrieve("0b19e3b6-9fae-40e1-a7c2-f2db1cae8a5a")
  #     => Creditario::Application
  #
  # - Crear una Solicitud:
  #
  #     result = Creditario::Applications.create(customer_id: "2e9d05b8-2180-4779-bab6-bdfd41d1569f", product_id: "c005b7f7-a44a-4ec0-bf7f-73d15d806fd9")
  #     => Creditario::Application
  #
  # - Actualizar una Solicitud:
  #
  #     result = Creditario::Applications.update("c0324939-0802-41b2-b81e-04e8982270ec", { street: "Avenida Siempre Viva", exterior_number: "742" })
  #     => Creditario::Customer
  module Applications
    extend Creditario::API::List
    extend Creditario::API::Retrieve
    extend Creditario::API::Create
    extend Creditario::API::Update

    ###
    # Path de la API donde se ejecutan las peticiones para Solicitudes.
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
