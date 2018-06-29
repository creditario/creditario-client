# frozen_string_literal: true

module Creditario # :nodoc:
  module API
    ###
    # == Creditario::API::Retrieve
    #
    # Modulo encargado de obtener un solo recurso de la API de creditar.io
    module Retrieve
      ###
      # Realiza una llamada GET al path del Repositorio que este haciendo uso
      # de este modulo.
      #
      # Devuelve una instancia del Recurso específico que el Repositorio maneja.
      def retrieve(id, query_params = {})
        path = self.resource_path + "/#{id}"
        response = API.request(:get, path, query_params)

        attributes = response.dig("data").first
        links = response.dig("links")

        self.resource_class.new(attributes, links)
      end
    end
  end
end
