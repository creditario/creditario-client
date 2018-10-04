# frozen_string_literal: true

require "test_helper"

class Creditario::CreditsTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::Credits
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    }
  end

  def test_it_list_credits_per_customer
    stub_request(:get, build_api_uri("credits", nil, customer_id: "f916636d-e045-43e4-898d-14e6dddf13f9")).
      with(headers: @headers).
      to_return(use_fixture("GET-Credits-200"))

    result = @subject.list(customer_id: "f916636d-e045-43e4-898d-14e6dddf13f9")

    assert result.is_a? Creditario::ResourcesCollection
    assert_equal result.items.size, 1
  end

  def test_it_retrieves_a_credit
    stub_request(:get, build_api_uri("credits", "33ca13b7-9910-430c-b5d7-7ba12a9b18a5")).
      with(headers: @headers).
      to_return(use_fixture("GET-Credit-200"))

    result = @subject.retrieve("33ca13b7-9910-430c-b5d7-7ba12a9b18a5")

    assert result.is_a? Creditario::Credit
  end

  def test_it_retrieves_a_missing_credit
    stub_request(:get, build_api_uri("credits", "53ca13b7-9910-430c-b5d7-7ba12a9b18a5")).
      with(headers: @headers).
      to_return(use_fixture("GET-Credit-404"))

    result = @subject.retrieve("53ca13b7-9910-430c-b5d7-7ba12a9b18a5")

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end
end
