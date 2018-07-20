# frozen_string_literal: true

require "test_helper"

class Creditario::IncomesTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::Incomes
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    }
  end

  def test_it_retrieves_an_income
    stub_request(:get, build_api_uri("incomes", "78883027-713b-4ac0-be50-b8a67e7bf478")).
      with(headers: @headers).
      to_return(use_fixture("GET-Income-200"))

    result = @subject.retrieve("78883027-713b-4ac0-be50-b8a67e7bf478")

    assert result.is_a? Creditario::Income
  end

  def test_it_retrieves_a_missing_income
    stub_request(:get, build_api_uri("incomes", "78883027-713b-4ac0-be50-b8a67e7bf479")).
      with(headers: @headers).
      to_return(use_fixture("GET-Income-404"))

    result = @subject.retrieve("78883027-713b-4ac0-be50-b8a67e7bf479")

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end

  def test_it_creates_an_income
    stub_request(:post, build_api_uri("incomes")).with(headers: @headers).
      to_return(use_fixture("POST-Income-201"))

    create_income_params = {
      classification: "Trabajo",
      amount_cents: 450000,
      credit_application_id: "5a00080b-7d3d-4e37-965e-6697729752be"
    }

    result = @subject.create(create_income_params)

    assert result.is_a? Creditario::Income
  end

  def test_it_deletes_an_income
    stub_request(:delete, build_api_uri("incomes", "78883027-713b-4ac0-be50-b8a67e7bf478")).with(headers: @headers).
      to_return(use_fixture("DELETE-Income-204"))

    result = @subject.delete("78883027-713b-4ac0-be50-b8a67e7bf478")

    assert_equal result.code, "204"
  end
end
