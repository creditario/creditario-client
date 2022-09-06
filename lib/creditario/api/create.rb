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
      #
      # Nota: Si desea hacer uso de *multipart/form-data* es necesario pasar un parametro enctype con valor true
      # para habilitarlo, por ejemplo:
      #
      #     result = Creditario::Crowdfunding::Investors.create(email: "karla@quiereinvertir.com", encypte: true)
      #
      def create(params = {})
        enctype = params.delete(:enctype) || false
        request_method = enctype ? :multipart : :post
        response = API.request(request_method, self.resource_path, params)

        attributes = response.dig("data").first
        links = response.dig("links")

        self.resource_class.new(attributes, links)
      rescue Creditario::Exceptions::UnprocessableEntityError => exception
        exception.server_response
      end
    end
  end
end
