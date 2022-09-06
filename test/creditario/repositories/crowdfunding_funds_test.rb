# frozen_string_literal: true

require "test_helper"

class Creditario::CrowdfundingFundsTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::Crowdfunding::Funds
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    }
    @fund_params = {
      source_id: "e3254d40-8982-4d2e-aacc-ce7e696f7f4e",
      source_type: "CreditApplication",
      amount_cents: 100000000,
      success_percentage: 80,
      funds_without_limit: true,
      campaign_days: 10
    }
  end

  def test_it_lists_funds
    stub_request(:get, build_api_uri("crowdfunding/funds")).
      with(headers: @headers).
      to_return(use_fixture("GET-Funds-200"))

    result = @subject.list

    assert result.is_a? Creditario::PaginatedCollection
    assert_equal result.items.size, 4
  end

  def test_it_retrieves_an_fund
    stub_request(:get, build_api_uri("crowdfunding/funds", "82875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")).
      with(headers: @headers).
      to_return(use_fixture("GET-Fund-200"))

    result = @subject.retrieve("82875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")

    assert result.is_a? Creditario::Crowdfunding::Fund
  end

  def test_it_retrieves_a_missing_fund
    stub_request(:get, build_api_uri("crowdfunding/funds", "92875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")).
      with(headers: @headers).
      to_return(use_fixture("GET-Fund-404"))

    result = @subject.retrieve("92875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end

  def test_it_creates_an_fund
    stub_request(:post, build_api_uri("crowdfunding/funds")).
      with(headers: @headers).
      to_return(use_fixture("POST-Fund-201"))

    result = @subject.create(@fund_params)

    assert result.is_a? Creditario::Crowdfunding::Fund
  end

  def test_it_creates_fund_fail
    stub_request(:post, build_api_uri("crowdfunding/funds")).
      with(headers: @headers).
      to_return(use_fixture("POST-Fund-201"))

    result = @subject.create(@fund_params)

    assert result.is_a? Creditario::Crowdfunding::Fund
  end
end
