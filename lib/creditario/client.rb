# frozen_string_literal: true

require "creditario/client/version"

module Creditario # :nodoc:
  ###
  # == Creditario::Client
  # Modulo que será utilizado para consumir la API de creditar.io
  module Client
    ###
    # URL al ambiente de *production* de la API de creditar.io
    @api_base = "https://www.creditar.io"

    class << self
      ###
      # La API Key es necesaria para cualquier interacción con la API de creditar.io
      #
      # Después de requerir la gema, lo más recomendado es definir la API Key a
      # utilizar en todas las llamadas a la API.
      #
      # ==== Ejemplo
      #   Creditario::Client.api_key = "BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
      attr_accessor :api_key

      ###
      # URL en la cual se ejecutarán las interacciones con la API de creditar.io
      #
      # Util cuando se desea utilizar el ambiente de *staging* por ejemplo.
      #
      # ==== Ejemplo
      #
      #  Creditario::Client.api_base = "https://staging.creditar.io"
      attr_accessor :api_base
    end
  end
end
