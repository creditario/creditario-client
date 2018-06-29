# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::PaginatedCollection
  #
  # Representa una colección de recursos paginados, a los cuales se puede acceder mediante
  # el atributo +items+.
  #
  # También contiene información relacionada a los recursos relacionados mediante
  # el atributo +links+.
  #
  # Así como los cursores de la paginación, encontados en el atributo +cursors+
  class PaginatedCollection
    ###
    # Arreglo de todos los recursos obtenidos de la API
    attr_reader :items

    ###
    # Links relacionados a la llamada realizada a la API
    attr_reader :links

    ###
    # Información sobre el siguiente cursor utilizado en la paginación
    attr_reader :cursors

    ###
    # Recibe el JSON parseado de la llamada ejecutada a la API y lo procesa
    # obteniendo así la colección de items de la clase específica a la que pertenecen,
    # los links y los cursores de paginación.
    def initialize(json_response = {}, item_class)
      @items = build_items(json_response.dig("data"), item_class)
      @links = json_response.dig("links")
      @cursors = json_response.dig("pagination", "cursors")
    end

    private

      def build_items(array, item_class)
        array.map do |item|
          item_class.new(item)
        end
      end
  end
end
