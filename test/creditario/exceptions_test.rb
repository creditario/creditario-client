# frozen_string_literal: true

require "test_helper"

class Creditario::ExceptionsTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::Products
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    }
  end

  def test_it_raises_missing_api_key_error
    assert_raises Creditario::Exceptions::MissingAPIKeyError do
      Creditario::Client.api_key = nil
      @subject.list
    end
  end

  def test_it_raises_invalid_api_key_error
    assert_raises Creditario::Exceptions::InvalidAPIKeyError do
      stub_request(:get, build_api_uri("products", "92875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")).
        with(headers: @headers).
        to_return(use_fixture("GET-Product-401"))
      @subject.retrieve("92875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")
    end
  end

  def test_it_raises_api_not_reachable_error
    assert_raises Creditario::Exceptions::APINotReachableError do
      stub_request(:get, build_api_uri("products", "92875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")).
        with(headers: @headers).
        to_raise(Errno::ECONNREFUSED)
      @subject.retrieve("92875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")
    end
  end

  def test_it_raises_invalid_response_error
    assert_raises Creditario::Exceptions::InvalidResponseBodyError do
      stub_request(:get, build_api_uri("products", "92875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")).
        with(headers: @headers).
        to_return(use_fixture("GET-Product-500"))
      @subject.retrieve("92875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")
    end
  end

  def test_it_raises_api_busy_error
    assert_raises Creditario::Exceptions::APIBusyError do
      stub_request(:get, build_api_uri("products", "92875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")).
        with(headers: @headers).
        to_timeout
      @subject.retrieve("92875f86-2d4e-4c4e-b0a4-7d2c4a4ca52f")
    end
  end
end
