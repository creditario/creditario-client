# frozen_string_literal: true

require "test_helper"

class Creditario::PaymentsTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::Payments
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    }
  end

  def test_it_list_payments_per_credit
    stub_request(:get, build_api_uri("payments", nil, credit_id: "76f54374-23e8-44ba-9213-9ce5c3d1ee4e")).
      with(headers: @headers).
      to_return(use_fixture("GET-Payments-200"))

    result = @subject.list(credit_id: "76f54374-23e8-44ba-9213-9ce5c3d1ee4e")

    assert result.is_a? Creditario::ResourcesCollection
    assert_equal result.items.size, 2
  end

  def test_it_create_a_credit
    stub_request(:post, build_api_uri("payments")).
      with(headers: @headers).
      to_return(use_fixture("POST-Payment-202"))

    result = @subject.create(
      installment_id: "8e5d4762-7021-495e-b426-3a8c6c4b8f3d",
      payment_type: "annuity",
      amount_cents: 499317,
      payment_method: "SPEI"
    )

    assert result.is_a? Creditario::Payment
  end
end
