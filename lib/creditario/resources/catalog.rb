# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Catalog
  #
  # Representa un Catálogo del sistema creditar.io
  #
  # === Ejemplo
  #
  #   => catalog = Creditario::Catalog.new({resource: "customer", field: "source"})
  #   => catalog.resource
  #   => "customer"
  #   => catalog[:field]
  #   => "source"
  class Catalog
    include Resource
  end

  ###
  # == Creditario::CatalogValue
  #
  # Representa un Valor de Catálogo del sistema creditar.io
  #
  # === Ejemplo
  #
  #   => catalog = Creditario::CatalogValue.new({name: "Revista", value: "revista"})
  #   => catalog.name
  #   => "Revista"
  #   => catalog[:value]
  #   => "revista"
  class CatalogValue
    include Resource
  end
end
