# frozen_string_literal: true

class CreditarioAPITest < Minitest::Test
  def setup
    Creditario::Client.api_key = "BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    Creditario::Client.api_base = "http://localhost:3000"
  end

  private

    def use_fixture(filename, extension = "txt")
      fixture_path = File.join(".", "test", "fixtures", [filename, extension].join("."))
      File.open(fixture_path)
    end

    def build_api_uri(*parts)
      parts.unshift(Creditario::Client.api_base)
      parts.join("/")
    end
end
