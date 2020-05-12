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

          return response if response.code == "204" && response.body.nil?
          response_body = handle_responses(response)

          Oj.load(response_body)
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
              cache_enabled = params.delete(:cache)
              uri.query = URI.encode_www_form(params)

              request = set_request_headers(Net::HTTP::Get.new(uri))
              request = set_request_cache_headers(request) if defined?(Rails) && cache_enabled
              request
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

            request["User-Agent"] = "creditario-client gem v#{Creditario::Client::VERSION}"
            request["Accept"] = "application/vnd.creditar.v#{Creditario::Client.api_version}+json"

            request
          end

          def set_request_cache_headers(request)
            @@cached_request = Rails.cache.fetch(request.uri.to_s)

            if @@cached_request
              request["If-None-Match"] = @@cached_request[:etag]
              request["If-Modified-Since"] = @@cached_request[:last_modified]
            end

            request
          end

          def set_authorization_headers(request)
            raise Creditario::Exceptions::MissingAPIKeyError.new if Creditario::Client.api_key.nil?

            request = set_sandbox_header(request)
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

          def handle_responses(response)
            return @@cached_request[:payload] if response.code == "304" && @@cached_request

            if defined?(Rails) && response.code == "200" && response["Last-Modified"]
              cache_response = { etag: response["Etag"], last_modified: response["Last-Modified"], payload: response.body }

              Rails.cache.write(response.uri.to_s, cache_response, expires_in: 10.minutes)
            end

            response.body
          end
      end
    end
  end
end
