# frozen_string_literal: true

module Creditario # :nodoc:
  module API
    ###
    # == Creditario::API::Delete
    #
    # Modulo encargado de eliminar recursos existentes en la API de creditar.io
    module Delete
      ###
      # Realiza una llamada DELETE al path del Repositorio que este haciendo uso
      # de este modulo.
      #
      # Si todo sale bien, la respuesta no tendrá contenido alguno y el código de estado HTTP será 204.
      # De lo contrario, el código de estado HTTP será diferente a 204 y la respuesta tendrá los detalles
      # del error.
      def delete(id)
        path = [self.resource_path, id].join("/")
        API.request(:delete, path)
      rescue Creditario::Exceptions::ResourceNotFoundError => exception
        exception.server_response
      end
    end
  end
end
