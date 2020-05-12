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
      # Si todo sale bien devuelve una instancia del Recurso específico que el Repositorio maneja.
      # De lo contrario, regresa un Hash con los errores arrojados por el servidor de creditar.io
      def retrieve(id, query_params = {})
        parts = [self.resource_path, id]
        path = parts.compact.join("/")
        query_params[:cache] = true
        response = API.request(:get, path, query_params)

        attributes = response.dig("data").first
        links = response.dig("links")

        self.resource_class.new(attributes, links)
      rescue Creditario::Exceptions::ResourceNotFoundError => exception
        exception.server_response
      rescue Creditario::Exceptions::UnprocessableEntityError => exception
        exception.server_response
      end
    end
  end
end
