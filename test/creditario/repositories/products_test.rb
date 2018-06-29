# frozen_string_literal: true

require "test_helper"

class Creditario::ProductsTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::Products
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    }
  end

  def test_it_list_products
    stub_request(:get, "#{Creditario::Client.api_base}/products").
      with(headers: @headers).
      to_return(use_fixture("GET-Products-200"))

    result = @subject.list

    assert result.is_a? Creditario::PaginatedCollection
    assert_equal result.items.size, 2
  end

  def test_it_retrieves_a_product
    stub_request(:get, "#{Creditario::Client.api_base}/products/c005b7f7-a44a-4ec0-bf7f-73d15d806fd9").
      with(headers: @headers).
      to_return(use_fixture("GET-Product-200"))

    result = @subject.retrieve("c005b7f7-a44a-4ec0-bf7f-73d15d806fd9")

    assert result.is_a? Creditario::Product
  end

  def test_it_retrieves_a_missing_product
    stub_request(:get, "#{Creditario::Client.api_base}/products/c005b7f7-b124-4ec0-bf7f-73d15d806fd9").
      with(headers: @headers).
      to_return(use_fixture("GET-Product-404"))

    result = @subject.retrieve("c005b7f7-b124-4ec0-bf7f-73d15d806fd9")

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end
end
