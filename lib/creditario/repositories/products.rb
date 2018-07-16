# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Products
  #
  # Repositorio de Productos, permite realizar las siguientes operaciones
  # sobre Productos de creditar.io:
  #
  # - Obtener todos los Productos Activos:
  #
  #     result = Creditario::Products.list
  #     => Creditario::PaginatedCollection
  #
  #     result.items
  #     => [Creditario::Product, Creditario::Product, ...]
  #
  # - Obtener un Producto en especifico:
  #
  #     Creditario::Products.retrieve("c005b7f7-a44a-4ec0-bf7f-73d15d806fd9")
  #     => Creditario::Product
  module Products
    extend Creditario::API::List
    extend Creditario::API::Retrieve

    ###
    # Path de la API donde se ejecutan las peticiones para Productos.
    def self.resource_path
      "/products"
    end

    ###
    # Clase a utilizar para transformar las respuestas de la API.
    def self.resource_class
      Creditario::Product
    end
  end
end
