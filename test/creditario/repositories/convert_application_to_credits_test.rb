# frozen_string_literal: true

require "test_helper"

class Creditario::ConvertApplicationToCreditsTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::ConvertApplicationToCredits
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    }
  end

  def test_it_creates_an_application_to_credit
    stub_request(:post, build_api_uri("convert_application_to_credits"))
      .with(headers: @headers)
      .to_return(use_fixture("POST-ConvertApplicationToCredits-201"))

    result = @subject.create(
      credit_application_id: "66abcc04-9f1a-4dc8-9181-897aaf9c4337",
      accepted_at: "2020-05-21",
      first_payment_date: "2020-05-22"
    )

    assert result.is_a? Creditario::Credit
  end

  def test_it_creates_an_application_to_credit_fail
    stub_request(:post, build_api_uri("convert_application_to_credits")).
      with(headers: @headers).
      to_return(use_fixture("POST-ConvertApplicationToCredits-422"))

    result = @subject.create(
      credit_application_id: "not_found"
    )

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end
end
