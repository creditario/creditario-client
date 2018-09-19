# frozen_string_literal: true

require "test_helper"

class Creditario::CreditEstimatesTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::CreditEstimates
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    }
  end

  def test_it_retrieves_a_credit_estimate
    stub_request(:get, build_api_uri("credit_estimates", nil, product_id: "47a6377f-3939-4736-87e3-aad48b4c882c", amount_cents: "1000000", installments_number: "12")).
      with(headers: @headers).
      to_return(use_fixture("GET-CreditEstimate-200"))

    result = @subject.retrieve(nil, product_id: "47a6377f-3939-4736-87e3-aad48b4c882c", amount_cents: 1000000, installments_number: 12)

    assert result.is_a? Creditario::CreditEstimate
  end

  def test_it_retrieves_a_credit_estimate_with_missing_params
    stub_request(:get, build_api_uri("credit_estimates", nil, product_id: "47a6377f-6530-4678-87e3-aad48b4c882c")).
      with(headers: @headers).
      to_return(use_fixture("GET-CreditEstimate-422"))

    result = @subject.retrieve(nil, product_id: "47a6377f-6530-4678-87e3-aad48b4c882c")

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end

  def test_it_retrieves_a_credit_estimate_from_missing_product
    stub_request(:get, build_api_uri("credit_estimates", nil, product_id: "47a6377f-6530-4678-87e3-aad48b4c882c", amount_cents: "1000000", installments_number: "12")).
      with(headers: @headers).
      to_return(use_fixture("GET-CreditEstimate-404"))

    result = @subject.retrieve(nil, product_id: "47a6377f-6530-4678-87e3-aad48b4c882c", amount_cents: 1000000, installments_number: 12)

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end
end
