# frozen_string_literal: true

require "test_helper"

class Creditario::ClientTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Creditario::Client::VERSION
  end

  def test_that_it_has_an_api_base
    refute_nil ::Creditario::Client.api_base
  end

  def test_that_it_receives_an_api_key
    ::Creditario::Client.api_key = "BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    refute_nil ::Creditario::Client.api_key
  end

  def test_that_it_has_a_products_repository
    assert Creditario::Client.products.is_a? Module
    assert_equal Creditario::Client.products.to_s, "Creditario::Products"
  end

  def test_that_it_has_a_customers_repository
    assert Creditario::Client.customers.is_a? Module
    assert_equal Creditario::Client.customers.to_s, "Creditario::Customers"
  end

  def test_that_it_has_an_applications_repository
    assert Creditario::Client.applications.is_a? Module
    assert_equal Creditario::Client.applications.to_s, "Creditario::Applications"
  end
end
