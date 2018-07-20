# frozen_string_literal: true

require "test_helper"

class Creditario::CatalogsTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::Catalogs
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    }
  end

  def test_it_list_available_catalogs
    stub_request(:get, build_api_uri("catalogs")).
      with(headers: @headers).
      to_return(use_fixture("GET-Catalogs-200"))

    result = @subject.list

    assert result.is_a? Creditario::ResourcesCollection
    assert result.items.first.is_a? Creditario::Catalog
    assert_equal result.items.size, 8
  end

  def test_it_retrieves_catalog_values
    stub_request(:get, build_api_uri("catalog", nil, resource: "customer", field: "source")).
      with(headers: @headers).
      to_return(use_fixture("GET-Catalog-200"))

    result = @subject.retrieve(resource: "customer", field: "source")

    assert result.is_a? Creditario::ResourcesCollection
    assert result.items.first.is_a? Creditario::CatalogValue
    assert_equal result.items.size, 3
  end

  def test_it_retrieves_missing_catalog_values
    stub_request(:get, build_api_uri("catalog", nil, resource: "customer", field: "email")).
      with(headers: @headers).
      to_return(use_fixture("GET-Catalog-404"))

    result = @subject.retrieve(resource: "customer", field: "email")

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end
end
