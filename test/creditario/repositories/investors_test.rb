# frozen_string_literal: true

require "test_helper"

class Creditario::InvestorsTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::Investors
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    }
    @investor_params = {
      email: "usuario@lendsmoney.com",
      first_name: "Juan",
      second_name: "Carlos",
      last_name: "Flores",
      mother_name: "Iglesias"
    }
  end

  def test_it_list_investors
    stub_request(:get, build_api_uri("investors")).
      with(headers: @headers).
      to_return(use_fixture("GET-Investors-200"))

    result = @subject.list

    assert result.is_a? Creditario::PaginatedCollection
    assert_equal result.items.size, 2
  end

  def test_it_retrieves_a_investor
    stub_request(:get, build_api_uri("investors", "82875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")).
      with(headers: @headers).
      to_return(use_fixture("GET-Investor-200"))

    result = @subject.retrieve("82875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")

    assert result.is_a? Creditario::Investor
  end

  def test_it_retrieves_a_missing_investor
    stub_request(:get, build_api_uri("investors", "92875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")).
      with(headers: @headers).
      to_return(use_fixture("GET-Investor-404"))

    result = @subject.retrieve("92875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end

  def test_it_creates_a_investor
    stub_request(:post, build_api_uri("investors")).
      with(headers: @headers).
      to_return(use_fixture("POST-Investor-201"))

    result = @subject.create(@investor_params)

    assert result.is_a? Creditario::Investor
  end

  def test_it_creates_investor_fail
    stub_request(:post, build_api_uri("investors")).
      with(headers: @headers).
      to_return(use_fixture("POST-Investor-201"))

    result = @subject.create(@investor_params)

    assert result.is_a? Creditario::Investor
  end

  def test_it_updates_a_investor
    stub_request(:patch, build_api_uri("investors", "2e9d05b8-2180-4779-bab6-bdfd41d1569f")).
      with(headers: @headers).
      to_return(use_fixture("PATCH-Investor-202"))

    result = @subject.update("2e9d05b8-2180-4779-bab6-bdfd41d1569f", @investor_params)

    assert result.is_a? Creditario::Investor
  end

  def test_it_updates_blocked_investor
    stub_request(:patch, build_api_uri("investors", "2e9d05b8-2180-4779-bab6-bdfd41d1569f")).
      with(headers: @headers).
      to_return(use_fixture("PATCH-Investor-403"))

    result = @subject.update("2e9d05b8-2180-4779-bab6-bdfd41d1569f", @investor_params)

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end

  def test_it_updates_investor_fail
    stub_request(:patch, build_api_uri("investors", "2e9d05b8-2180-4779-bab6-bdfd41d1569f")).
      with(headers: @headers).
      to_return(use_fixture("PATCH-Investor-422"))

    result = @subject.update("2e9d05b8-2180-4779-bab6-bdfd41d1569f", @investor_params)

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end

  def test_it_updates_investor_not_found
    stub_request(:patch, build_api_uri("investors", "2e9d05b8-2180-4779-bab6-bdfd41d1569f")).
      with(headers: @headers).
      to_return(use_fixture("PATCH-Investor-404"))

    result = @subject.update("2e9d05b8-2180-4779-bab6-bdfd41d1569f", @investor_params)

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end
end
