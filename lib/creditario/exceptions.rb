# frozen_string_literal: true

module Creditario
  ###
  # === Creditario::Exceptions
  #
  # Modulo para definir todas las excepciones reconocidas para esta gema.
  module Exceptions
    ###
    # Excepción arrojada cuando se intenta hacer un request sin haber
    # especificado un api_key.
    #
    # Para arreglar este error es necesario definir el api_key de la siguiente manera:
    #
    #   Creditario::Client.api_key = "tu-api-key"
    class APIKeyError < StandardError
      def initialize(msg = "No API Key Provided") # :nodoc:
        super
      end
    end

    ###
    # Excepción arrojada cuando se intenta acceder a algún recurso
    # que no existe en creditar.io
    #
    # Si se rescata esta excepción, se puede acceder a su atributo *response*
    # para obtener la respuesta de creditar.io
    class ResourceNotFoundError < StandardError
      ###
      # Contiene los detalles de la respuesta de creditar.io
      attr_reader :server_response

      def initialize(response) # :nodoc:
        @server_response = Oj.load(response.body)
        super(msg = "The resource does not exist")
      end
    end

    ###
    # Excepción arrojada cuando durante la creación o actualización
    # de algún recurso, se envían datos inválidos a creditar.io
    #
    # Si se rescata esta excepción, se puede acceder a su atributo *response*
    # para obtener la respuesta de creditar.io
    class UnprocessableEntityError < StandardError
      ###
      # Contiene los detalles de la respuesta de creditar.io
      attr_reader :server_response

      def initialize(response) # :nodoc:
        @server_response = Oj.load(response.body)
        super(msg = "There are some validation issues")
      end
    end
  end
end
