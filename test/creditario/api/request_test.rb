# frozen_string_literal: true

require "test_helper"

class Creditario::API::RequestTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::API::Request
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    }
  end

  def test_that_it_make_get_requests
    stub_request(:get, "#{Creditario::Client.api_base}/products").
      with(headers: @headers).
      to_return(status: 200, body: "{}")

    @subject.request(:get, "/products")

    assert_requested :get, "#{Creditario::Client.api_base}/products"
  end

  def test_that_it_make_post_request
    stub_request(:post, "#{Creditario::Client.api_base}/customers").
      with(headers: @headers).
      to_return(status: 201, body: "{}")

    @subject.request(:post, "/customers")

    assert_requested :post, "#{Creditario::Client.api_base}/customers"
  end

  def test_that_it_make_patch_request
    stub_request(:patch, "#{Creditario::Client.api_base}/customers/eeedba2e-fc96-4f96-bd2e-bd046b256f96").
      with(headers: @headers).
      to_return(status: 202, body: "{}")

    @subject.request(:patch, "/customers/eeedba2e-fc96-4f96-bd2e-bd046b256f96")

    assert_requested :patch, "#{Creditario::Client.api_base}/customers/eeedba2e-fc96-4f96-bd2e-bd046b256f96"
  end

  def test_that_it_make_delete_request
    stub_request(:delete, "#{Creditario::Client.api_base}/customers/eeedba2e-fc96-4f96-bd2e-bd046b256f96").
      with(headers: @headers).
      to_return(status: 202, body: "{}")

    @subject.request(:delete, "/customers/eeedba2e-fc96-4f96-bd2e-bd046b256f96")

    assert_requested :delete, "#{Creditario::Client.api_base}/customers/eeedba2e-fc96-4f96-bd2e-bd046b256f96"
  end

  def test_that_it_handles_exceptions
    stub_request(:get, "#{Creditario::Client.api_base}/customers/eeedba2e-fc96-4f96-bd2e-bd046b256f96").
      with(headers: @headers).
      to_return(status: 404, body: "{}")

    assert_raises Creditario::Exceptions::ResourceNotFoundError do
      @subject.request(:get, "/customers/eeedba2e-fc96-4f96-bd2e-bd046b256f96")

      assert_requested :get, "#{Creditario::Client.api_base}/customers/eeedba2e-fc96-4f96-bd2e-bd046b256f96"
    end
  end
end
