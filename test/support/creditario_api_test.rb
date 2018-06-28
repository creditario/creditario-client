# frozen_string_literal: true

class CreditarioAPITest < Minitest::Test
  def setup
    Creditario::Client.api_key = "BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    Creditario::Client.api_base = "http://localhost:3000"
  end
end
