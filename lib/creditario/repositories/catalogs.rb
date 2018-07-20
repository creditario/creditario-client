# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Catalogs
  #
  # Repositorio de Catálogos, permite realizar las siguientes operaciones
  # sobre Catálogos de creditar.io:
  #
  # - Obtener todos los Catálogos disponibles:
  #
  #     result = Creditario::Catalogs.list
  #     => Creditario::ResourcesCollection
  #
  #     result.items
  #     => [Creditario::Catalog, Creditario::Catalog, ...]
  #
  # - Obtener los valores de un Catálogo en especifico:
  #
  #     Creditario::Catalog.retrieve(resource: "customer", field: "source")
  #     => Creditario::ResourcesCollection
  module Catalogs
    extend Creditario::API::List

    ###
    # Path de la API donde se ejecutan las peticiones para Catálogos
    def self.resource_path
      if caller_locations[0].label == "retrieve"
        "/catalog"
      else
        "/catalogs"
      end
    end

    ###
    # Clase a utilizar para transformar las respuestas de la API.
    def self.resource_class
      if caller_locations[0].label == "retrieve"
        Creditario::CatalogValue
      else
        Creditario::Catalog
      end
    end

    ###
    # Método para obtener los valores de un Catálogo, que generalmente son varios.
    # Es por ello que no se extendió el modulo Creditario::API::Retrieve ya que ese está pensado
    # para procesar un solo Recurso a la vez.
    #
    # Los *search_params* necesitan ser **resource** y **field** tal y como se especifica
    # en la descripción del Repositorio Creditario::Catalogs.
    def self.retrieve(**search_params)
      response = API.request(:get, resource_path, search_params)
      ResourcesCollection.new(response, self.resource_class)
    rescue Creditario::Exceptions::ResourceNotFoundError => exception
      exception.server_response
    end
  end
end
