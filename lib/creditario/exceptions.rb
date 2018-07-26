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
    class MissingAPIKeyError < StandardError
      def initialize(msg = "No API Key Provided") # :nodoc:
        super
      end
    end

    ###
    # Excepción arrojada cuando se intenta acceder a algún recurso
    # que no existe en creditar.io
    #
    # Si se rescata esta excepción, se puede acceder a su atributo *server_response*
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
    # Si se rescata esta excepción, se puede acceder a su atributo *server_response*
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

    ###
    # Excepción arrojada cuando existen restricciones para crear o modificar un
    # recurso en creditar.io
    #
    # Si se rescata esta excepción, se puede acceder a su atributo *server_response*
    # para obtener la respuesta de creditar.io
    class ForbiddenError < StandardError
      ###
      # Contiene los detalles de la respuesta de creditar.io
      attr_reader :server_response

      def initialize(response) # :nodoc:
        @server_response = Oj.load(response.body)
        super(msg = "There are restrictions on the resource")
      end
    end

    ###
    # Excepción arrojada cuando se intenta hacer un request con una API Key inválida.
    # Para arreglar este error es necesario definir la API Key correcta.
    #
    #   Creditario::Client.api_key = "tu-api-key"
    class InvalidAPIKeyError < StandardError
      def initialize(msg = "The API Key provided is invalid or it has expired.") # :nodoc:
        super
      end
    end

    ###
    # Excepción arrojada cuando no se puede establecer comunicación con el servidor
    # de la API de creditar.io
    class APINotReachableError < StandardError
      TECHNICAL_MESSAGE = "Technical message -> " # :nodoc:
      HUMAN_MESSAGE = "Looks like the API for creditar.io is down.\n" # :nodoc:

      def initialize(message) # :nodoc:
        super(msg = "#{HUMAN_MESSAGE}#{TECHNICAL_MESSAGE}#{message}")
      end
    end

    ###
    # Excepción arrojada cuando el servidor de creditar.io regresa una respuesta que no es JSON
    # Probablemente estás mandando un header incorrecto.
    class InvalidResponseBodyError < StandardError
      TECHNICAL_MESSAGE = "Technical message -> " # :nodoc:
      HUMAN_MESSAGE = "The API responded with something that is not JSON, is your request ok?\n" # :nodoc:

      def initialize(message) # :nodoc:
        super(msg = "#{HUMAN_MESSAGE}#{TECHNICAL_MESSAGE}#{message}")
      end
    end

    ###
    # Excepción arrojada cuando el servidor de creditar.io se tarda mucho en responder.
    # O cuando se pierde la conexión de internet a medio request.
    # Probablemente reintentando la petición se solucione el problema.
    class APIBusyError < StandardError
      TECHNICAL_MESSAGE = "Technical message -> " # :nodoc:
      HUMAN_MESSAGE = "The communication with the API has timed out.\n" # :nodoc:

      def initialize(message) # :nodoc:
        super(msg = "#{HUMAN_MESSAGE}#{TECHNICAL_MESSAGE}#{message}")
      end
    end
  end
end
