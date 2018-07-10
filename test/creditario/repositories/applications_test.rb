# frozen_string_literal: true

require "test_helper"

class Creditario::ApplicationsTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::Applications
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    }
  end

  def test_it_list_applications
    stub_request(:get, build_api_uri("applications")).
      with(headers: @headers).
      to_return(use_fixture("GET-Applications-200"))

    result = @subject.list

    assert result.is_a? Creditario::PaginatedCollection
    assert_equal result.items.size, 2
  end

  def test_it_retrieves_an_application
    stub_request(:get, build_api_uri("applications", "3c8b46ce-a5f2-4f25-8280-a80551eacd21")).
      with(headers: @headers).
      to_return(use_fixture("GET-Application-200"))

    result = @subject.retrieve("3c8b46ce-a5f2-4f25-8280-a80551eacd21")

    assert result.is_a? Creditario::Application
  end

  def test_it_retrieves_a_missing_application
    stub_request(:get, build_api_uri("applications", "9c8b46ce-a5f2-4f25-8280-a80551eacd21")).
      with(headers: @headers).
      to_return(use_fixture("GET-Application-404"))

    result = @subject.retrieve("9c8b46ce-a5f2-4f25-8280-a80551eacd21")

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end
end
