# frozen_string_literal: true

require "net/http"
require "net/http/post/multipart"

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
        # - :multipart
        def request(method, path, params = {})
          uri = URI(Creditario::Client.api_base + path)
          request = request_from_method(method, uri, params)

          response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https") do |http|
            http.request(request)
          end

          handle_errored_responses(response)

          return response if response.body.nil?
          Oj.load(response.body)
        rescue Oj::ParseError => ex
          raise Exceptions::InvalidResponseBodyError, ex.message
        rescue Net::OpenTimeout => ex
          raise Exceptions::APIBusyError, ex.message
        rescue Errno::ECONNREFUSED => ex
          raise Exceptions::APINotReachableError, ex.message
        end

        private

          def request_from_method(method, uri, params)
            case method
            when :get
              uri.query = URI.encode_www_form(params)
              set_request_headers(Net::HTTP::Get.new(uri))
            when :post
              set_request_body(set_request_headers(Net::HTTP::Post.new(uri)), params)
            when :multipart
              set_authorization_headers(Net::HTTP::Post::Multipart.new(uri, params))
            when :delete
              set_request_headers(Net::HTTP::Delete.new(uri))
            when :patch
              set_request_body(set_request_headers(Net::HTTP::Patch.new(uri)), params)
            end
          end

          def set_request_headers(request)
            request = set_authorization_headers(request)
            request = set_sandbox_header(request)

            request["Accept"] = "application/vnd.creditar.v#{Creditario::Client.api_version}+json"
            request["Content-Type"] = "application/json"

            request
          end

          def set_authorization_headers(request)
            raise Creditario::Exceptions::MissingAPIKeyError.new if Creditario::Client.api_key.nil?

            request["Authorization"] = "Token token=#{Creditario::Client.api_key}"
            request
          end

          def set_sandbox_header(request)
            request["Application-Context"] = !Creditario::Client.sandbox || "sandbox"
            request
          end

          def set_request_body(request, params)
            request.body = params.to_json
            request
          end

          def handle_errored_responses(response)
            return if response.code.to_i < 400

            raise Exceptions::InvalidAPIKeyError if response.code == "401"
            raise Exceptions::ForbiddenError.new(response) if response.code == "403"
            raise Exceptions::ResourceNotFoundError.new(response) if response.code == "404"
            raise Exceptions::UnprocessableEntityError.new(response) if response.code == "422"
          end
      end
    end
  end
end
