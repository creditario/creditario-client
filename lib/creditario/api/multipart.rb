# frozen_string_literal: true

module Creditario # :nodoc:
  module API
    ###
    # == Creditario::API:Multipart
    #
    # Modulo encargado de generar recursos nuevos de tipo +multipart/form-data+ en la API de creditario.io
    module Multipart
      ###
      # Realiza una llamada POST de tipo +multipart/form-data+ al path del Repositorio que esta haciendo
      # uso de este modulo.
      #
      # Si todo sale bien devuelve una instancia del Recurso específico que el
      # Repositorio maneja.
      # De lo contrario, regresa un Hash con los errores arrojados por el servidor de creditar.io
      def create(params = {})
        response = API.request(:multipart_post, self.resource_path, params)

        attributes = response.dig("data").first
        links = response.dig("links")

        self.resource_class.new(attributes, links)
      rescue Creditario::Exceptions::UnprocessableEntityError => exception
        exception.server_response
      end
    end
  end
end
