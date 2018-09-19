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

  def test_that_it_has_a_contracts_repository
    assert Creditario::Client.contracts.is_a? Module
    assert_equal Creditario::Client.contracts.to_s, "Creditario::Contracts"
  end

  def test_that_it_has_a_catalogs_repository
    assert Creditario::Client.catalogs.is_a? Module
    assert_equal Creditario::Client.catalogs.to_s, "Creditario::Catalogs"
  end

  def test_that_it_has_an_incomes_repository
    assert Creditario::Client.incomes.is_a? Module
    assert_equal Creditario::Client.incomes.to_s, "Creditario::Incomes"
  end

  def test_that_it_has_an_expenses_repository
    assert Creditario::Client.expenses.is_a? Module
    assert_equal Creditario::Client.expenses.to_s, "Creditario::Expenses"
  end

  def test_that_it_has_a_references_repository
    assert Creditario::Client.references.is_a? Module
    assert_equal Creditario::Client.references.to_s, "Creditario::References"
  end

  def test_that_it_has_a_attachments_repository
    assert Creditario::Client.attachments.is_a? Module
    assert_equal Creditario::Client.attachments.to_s, "Creditario::Attachments"
  end

  def test_that_it_has_a_credit_estimates_repository
    assert Creditario::Client.credit_estimates.is_a? Module
    assert_equal Creditario::Client.credit_estimates.to_s, "Creditario::CreditEstimates"
  end
end
