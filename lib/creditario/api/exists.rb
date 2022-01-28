# frozen_string_literal: true
require "base64"

module Creditario # :nodoc:
  module API
    ###
    # == Creditario::API::Exists
    #
    # Modulo encargado de obtener si un recurso existe en la API de creditar.io
    module Exists
      ###
      # Realiza una llamada GET al path del Repositorio que este haciendo uso
      # de este modulo.
      #
      # Si todo sale bien devuelve una instancia del Recurso específico que el Repositorio maneja.
      # De lo contrario, regresa un Hash con los errores arrojados por el servidor de creditar.io
      def exists(query_params = {})
        parts = [self.exists_resource_path]
        path = parts.compact.join("/")
        query_params[:cache] = true
        query_params[:email] = Base64.encode64(query_params[:email])[0..-2]
        response = API.request(:get, path, query_params)
        
      rescue Creditario::Exceptions::ResourceNotFoundError => exception
        exception.server_response
      rescue Creditario::Exceptions::UnprocessableEntityError => exception
        exception.server_response
      end
    end
  end
end
