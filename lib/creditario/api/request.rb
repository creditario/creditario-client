# frozen_string_literal: true

require "net/http"

module Creditario # :nodoc:
  module API # :nodoc:
    ###
    # Alias para el método Creditario::API::Request.request
    def self.request(*params)
      Request.request(*params)
    end

    ###
    # == Creditario::API::Request
    #
    # Modulo encargado de ejecutar los requests HTTP de cualquier tipo
    # a la API de creditar.io
    module Request
      class << self
        ###
        # Ejecuta un request HTTP a la API de creditar.io
        #
        # Los símbolos aceptados en el parámetro +method+ son:
        #
        # - :get
        # - :post
        # - :delete
        # - :patch
        def request(method, path, params = {})
          uri = URI(Creditario::Client.api_base + path)
          request = request_from_method(method, uri, params)

          response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https") do |http|
            http.request(request)
          end

          handle_exceptions(response)

          return response if response.body.nil?
          Oj.load(response.body)
        end

        private

          def request_from_method(method, uri, params)
            case method
            when :get
              uri.query = URI.encode_www_form(params)
              set_request_headers(Net::HTTP::Get.new(uri))
            when :post
              set_request_body(set_request_headers(Net::HTTP::Post.new(uri)), params)
            when :delete
              set_request_headers(Net::HTTP::Delete.new(uri))
            when :patch
              set_request_body(set_request_headers(Net::HTTP::Patch.new(uri)), params)
            end
          end

          def set_request_headers(request)
            raise Creditario::Exceptions::APIKeyError.new if Creditario::Client.api_key.nil?

            request["Accept"] = "application/vnd.creditar.v#{Creditario::Client.api_version}+json"
            request["Authorization"] = "Token token=#{Creditario::Client.api_key}"
            request["Content-Type"] = "application/json"

            request
          end

          def set_request_body(request, params)
            request.body = params.to_json
            request
          end

          def handle_exceptions(response)
            return if response.code.to_i < 400

            raise Exceptions::ForbiddenError.new(response) if response.code == "403"
            raise Exceptions::ResourceNotFoundError.new(response) if response.code == "404"
            raise Exceptions::UnprocessableEntityError.new(response) if response.code == "422"
          end
      end
    end
  end
end
