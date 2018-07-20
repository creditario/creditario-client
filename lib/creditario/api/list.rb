# frozen_string_literal: true

module Creditario # :nodoc:
  module API
    ###
    # == Creditario::API::List
    #
    # Modulo encargado de obtener recursos paginados de la API de creditar.io
    module List
      ###
      # Realiza una llamada GET al path del Repositorio que esta haciendo uso
      # de este modulo.
      #
      # Devuelve una colección paginada o normal de los recursos que el
      # Repositorio maneja.
      def list(query_params = {})
        response = API.request(:get, self.resource_path, query_params)

        if response.has_key? "pagination"
          PaginatedCollection.new(response, self.resource_class)
        else
          ResourcesCollection.new(response, self.resource_class)
        end
      end
    end
  end
end
