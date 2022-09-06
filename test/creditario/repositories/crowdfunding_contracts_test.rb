# frozen_string_literal: true

require "test_helper"

class Creditario::CrowdfundingContractsTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::Crowdfunding::Contracts
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    }
  end

  def test_it_retrieves_an_contract
    stub_request(:get, build_api_uri("crowdfunding/investor_contracts", "82875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")).
      with(headers: @headers).
      to_return(use_fixture("GET-InvestorContract-200"))

    result = @subject.retrieve("82875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")

    assert result.is_a? Creditario::Crowdfunding::Contract
  end

  def test_it_retrieves_a_missing_contract
    stub_request(:get, build_api_uri("crowdfunding/investor_contracts", "not_found")).
      with(headers: @headers).
      to_return(use_fixture("GET-InvestorContract-404"))

    result = @subject.retrieve("not_found")

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end
end
