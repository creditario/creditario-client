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
      #
      # Nota: Si desea hacer uso de *multipart/form-data* es necesario pasar un parametro enctype con valor true
      # para habilitarlo, por ejemplo:
      #
      #     result = Creditario::Crowdfunding::Investors.update("97d58a6c-e943-46bf-b8ec-2db7b397bc17", full_name: "Steve Rogers", encypte: true)
      #
      def update(id, params = {}, include_param = nil)
        enctype = params.delete(:enctype) || false
        path = "#{self.resource_path}/#{id}"
        path = include_param.nil? ? path : path + "?include=#{include_param}"
        request_method = enctype ? :multipart : :patch
        response = API.request(request_method, path, params)

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
