# frozen_string_literal: true

require "test_helper"
require "base64"

class Creditario::CustomersTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::Customers
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    }
    @customer_params = {
      email: "usuario@needsmoney.com",
      first_name: "Juan",
      second_name: "Carlos",
      last_name: "Flores",
      mother_name: "Iglesias"
    }
    @real_email = "usuario@needsmoney.com"
    @encoded_email = Base64.encode64(@real_email)[0..-2]
  end

  def test_it_list_customers
    stub_request(:get, build_api_uri("customers")).
      with(headers: @headers).
      to_return(use_fixture("GET-Customers-200"))

    result = @subject.list

    assert result.is_a? Creditario::PaginatedCollection
    assert_equal result.items.size, 2
  end

  def test_it_retrieves_a_customer
    stub_request(:get, build_api_uri("customers", "82875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")).
      with(headers: @headers).
      to_return(use_fixture("GET-Customer-200"))

    result = @subject.retrieve("82875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")

    assert result.is_a? Creditario::Customer
  end

  def test_it_retrieves_a_missing_customer
    stub_request(:get, build_api_uri("customers", "92875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")).
      with(headers: @headers).
      to_return(use_fixture("GET-Customer-404"))

    result = @subject.retrieve("92875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end

  def test_it_verify_a_customer
    stub_request(:get, build_api_uri("exists", "customer", nil, email: @encoded_email)).
      with(headers: @headers).
      to_return(use_fixture("GET-CustomerExists-200"))

    result = @subject.exists(email: @real_email)
    
    assert result.is_a? Hash
  end

  def test_it_verify_a_missing_customer
    stub_request(:get, build_api_uri("exists","customer", nil, email: @encoded_email)).
      with(headers: @headers).
      to_return(use_fixture("GET-CustomerExists-404"))

    result = @subject.exists(email: @real_email)

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end

  def test_it_creates_a_customer
    stub_request(:post, build_api_uri("customers")).
      with(headers: @headers).
      to_return(use_fixture("POST-Customer-201"))

    result = @subject.create(@customer_params)

    assert result.is_a? Creditario::Customer
  end

  def test_it_creates_customer_fail
    stub_request(:post, build_api_uri("customers")).
      with(headers: @headers).
      to_return(use_fixture("POST-Customer-201"))

    result = @subject.create(@customer_params)

    assert result.is_a? Creditario::Customer
  end

  def test_it_updates_a_customer
    stub_request(:patch, build_api_uri("customers", "2e9d05b8-2180-4779-bab6-bdfd41d1569f")).
      with(headers: @headers).
      to_return(use_fixture("PATCH-Customer-202"))

    result = @subject.update("2e9d05b8-2180-4779-bab6-bdfd41d1569f", @customer_params)

    assert result.is_a? Creditario::Customer
  end

  def test_it_updates_blocked_customer
    stub_request(:patch, build_api_uri("customers", "2e9d05b8-2180-4779-bab6-bdfd41d1569f")).
      with(headers: @headers).
      to_return(use_fixture("PATCH-Customer-403"))

    result = @subject.update("2e9d05b8-2180-4779-bab6-bdfd41d1569f", @customer_params)

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end

  def test_it_updates_customer_fail
    stub_request(:patch, build_api_uri("customers", "2e9d05b8-2180-4779-bab6-bdfd41d1569f")).
      with(headers: @headers).
      to_return(use_fixture("PATCH-Customer-422"))

    result = @subject.update("2e9d05b8-2180-4779-bab6-bdfd41d1569f", @customer_params)

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end

  def test_it_updates_customer_not_found
    stub_request(:patch, build_api_uri("customers", "2e9d05b8-2180-4779-bab6-bdfd41d1569f")).
      with(headers: @headers).
      to_return(use_fixture("PATCH-Customer-404"))

    result = @subject.update("2e9d05b8-2180-4779-bab6-bdfd41d1569f", @customer_params)

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end
end
