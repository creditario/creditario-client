# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Customers
  #
  # Repositorio de Clientes, permite realizar las siguientes operaciones
  # sobre Clientes de creditar.io
  #
  # - Obtener todos los Clientes:
  #
  #     result = Creditario::Customers.list
  #     => Creditario::PaginatedCollection
  #
  #     result.items
  #     => [Creditario::Customer, Creditario::Customer, ...]
  #
  # - Obtener un Cliente en especifico:
  #
  #     Creditario::Customers.retrieve("2e9d05b8-2180-4779-bab6-bdfd41d1569f")
  #     => Creditario::Customer
  #
  # - Crear un Cliente:
  #
  #     result = Creditario::Customers.create(email: "karla@quieredinero.com", first_name: "Karla")
  #     => Creditario::Customer
  #
  # - Actualizar un cliente:
  #
  #     result = Creditario::Customers.update("2e9d05b8-2180-4779-bab6-bdfd41d1569f", { email: "karina@necesitadinero.com" })
  #     => Creditario::Customer
  module Customers
    extend Creditario::API::List
    extend Creditario::API::Retrieve
    extend Creditario::API::Create
    extend Creditario::API::Update

    ###
    # Path de la API donde se ejecutan las peticiones para Clientes.
    def self.resource_path
      "/customers"
    end

    ###
    # Clase a utilizar para transformar las respuestas de la API
    def self.resource_class
      Creditario::Customer
    end
  end
end
