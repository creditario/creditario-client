# frozen_string_literal: true

module Creditario # :nodoc:
  module API
    ###
    # == Creditario::API::Update
    #
    # Modulo encargado de actualizar recursos existentes en la API de creditar.io
    module Update
      ###
      # Realizar una llamada PATCH al path del Repositorio que esta haciendo uso
      # de este modulo.
      #
      # Si todo sale bien devuelve una instancia del Recurso específico que el Repositorio maneja.
      # De lo contrario, regresa un Hash con los errores arrojados por el servidor de creditar.io
      def update(id, params = {}, include_param = nil)
        path = [self.resource_path, id].join("/")
        path = include_param.nil? ? path : path + "?include=#{include_param}"
        wrapped_params = { self.attributes_wrapper => params }
        response = API.request(:patch, path, wrapped_params)

        attributes = response.dig("data").first
        links = response.dig("links")

        self.resource_class.new(attributes, links)
      rescue Creditario::Exceptions::UnprocessableEntityError,
             Creditario::Exceptions::ResourceNotFoundError,
             Creditario::Exceptions::ForbiddenError => exception
        exception.server_response
      end
    end
  end
end
