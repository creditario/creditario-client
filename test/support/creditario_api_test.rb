# frozen_string_literal: true

require "uri"
require "tempfile"

class CreditarioAPITest < Minitest::Test
  def setup
    Creditario::Client.api_key = "BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    Creditario::Client.api_base = "http://localhost:3000"
  end

  private

    def image_fixture(file)
      fixture_path = File.join(".", "test", "fixtures", "images", file)
      File.open(fixture_path)
    end

    def use_fixture(filename, extension = "txt")
      fixture_path = File.join(".", "test", "fixtures", [filename, extension].join("."))
      File.open(fixture_path)
    end

    def build_api_uri(*parts, **query_params)
      query_string = URI.encode_www_form(query_params) unless query_params.empty?
      parts.unshift(Creditario::Client.api_base)

      if query_string
        parts.compact.join("/") + "?#{query_string}"
      else
        parts.compact.join("/")
      end
    end
end
