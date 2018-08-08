# frozen_string_literal: true

require "test_helper"

class Creditario::ContractsTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::Contracts
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    }
  end

  def test_it_retrieves_a_contract
    stub_request(:get, build_api_uri("contracts", "c005b7f7-a44a-4ec0-bf7f-73d15d806fd9")).
      with(headers: @headers).
      to_return(use_fixture("GET-Contract-200"))

    result = @subject.retrieve("c005b7f7-a44a-4ec0-bf7f-73d15d806fd9")

    assert result.is_a? Creditario::Contract
  end

  def test_it_retrieves_a_missing_contract
    stub_request(:get, build_api_uri("contracts", "c005b7f7-b124-4ec0-bf7f-73d15d806fd9")).
      with(headers: @headers).
      to_return(use_fixture("GET-Contract-404"))

    result = @subject.retrieve("c005b7f7-b124-4ec0-bf7f-73d15d806fd9")

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end
end
