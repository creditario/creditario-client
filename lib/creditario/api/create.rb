# frozen_string_literal: true

module Creditario # :nodoc:
  module API
    ###
    # == Creditario::API::Create
    #
    # Modulo encargado de generar recursos nuevos en la API de creditar.io
    module Create
      ###
      # Realiza una llamada POST al path del Repositorio que esta haciendo
      # uso de este modulo.
      #
      # Si todo sale bien devuelve una instancia del Recurso específico que el
      # Repositorio maneja.
      # De lo contrario, regresa un Hash con los errores arrojados por el servidor de creditar.io
      def create(**params)
        wrapped_params = { self.attributes_wrapper => params }
        response = API.request(:post, self.resource_path, wrapped_params)

        attributes = response.dig("data").first
        links = response.dig("links")

        self.resource_class.new(attributes, links)
      rescue Creditario::Exceptions::UnprocessableEntityError => exception
        exception.server_response
      end
    end
  end
end
