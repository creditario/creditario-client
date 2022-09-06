# frozen_string_literal: true

require "test_helper"

class Creditario::CrowdfundingCrowdfundsTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::Crowdfunding::Crowdfunds
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    }
    @crowdfund_params = {
      source_id: "e3254d40-8982-4d2e-aacc-ce7e696f7f4e",
      source_type: "CreditApplication",
      amount_cents: 100000000,
      success_percentage: 80,
      funds_without_limit: true,
      campaign_days: 10
    }
  end

  def test_it_lists_crowdfunds
    stub_request(:get, build_api_uri("crowdfunding/crowdfunds")).
      with(headers: @headers).
      to_return(use_fixture("GET-Crowdfunds-200"))

    result = @subject.list

    assert result.is_a? Creditario::PaginatedCollection
    assert_equal result.items.size, 2
  end

  def test_it_retrieves_an_crowdfund
    stub_request(:get, build_api_uri("crowdfunding/crowdfunds", "82875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")).
      with(headers: @headers).
      to_return(use_fixture("GET-Crowdfund-200"))

    result = @subject.retrieve("82875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")

    assert result.is_a? Creditario::Crowdfunding::Crowdfund
  end

  def test_it_retrieves_a_missing_crowdfund
    stub_request(:get, build_api_uri("crowdfunding/crowdfunds", "92875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")).
      with(headers: @headers).
      to_return(use_fixture("GET-Crowdfund-404"))

    result = @subject.retrieve("92875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end

  def test_it_creates_an_crowdfund
    stub_request(:post, build_api_uri("crowdfunding/crowdfunds")).
      with(headers: @headers).
      to_return(use_fixture("POST-Crowdfund-201"))

    result = @subject.create(@crowdfund_params)

    assert result.is_a? Creditario::Crowdfunding::Crowdfund
  end

  def test_it_creates_crowdfund_fail
    stub_request(:post, build_api_uri("crowdfunding/crowdfunds")).
      with(headers: @headers).
      to_return(use_fixture("POST-Crowdfund-201"))

    result = @subject.create(@crowdfund_params)

    assert result.is_a? Creditario::Crowdfunding::Crowdfund
  end
end
