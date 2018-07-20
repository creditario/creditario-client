# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::ResourcesCollection
  #
  # Representa una colección de recursos, a los cuales se puede acceder mediante
  # el atributo +items+.
  class ResourcesCollection
    ###
    # Arreglo de todos los recursos obtenidos de la API
    attr_reader :items

    ###
    # Links relacionados a la llamada realizada a la API
    attr_reader :links

    ###
    # Recibe el JSON parseado de la llamada ejecutada a la API y lo procesa
    # obteniendo así la colección de items de la clase específica a la que pertenecen
    # y sus links.
    def initialize(json_response = {}, item_class)
      @items = build_items(json_response.dig("data"), item_class)
      @links = json_response.dig("links")
    end

    private

      def build_items(array, item_class)
        array.map do |item|
          item_class.new(item)
        end
      end
  end
end
