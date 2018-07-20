# frozen_string_literal: true

require "test_helper"

class Creditario::ReferencesTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::References
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    }
  end

  def test_it_retrieves_a_reference
    stub_request(:get, build_api_uri("references", "f2fe28ae-8162-4209-ae1a-a570cadadaea")).
      with(headers: @headers).
      to_return(use_fixture("GET-Reference-200"))

    result = @subject.retrieve("f2fe28ae-8162-4209-ae1a-a570cadadaea")

    assert result.is_a? Creditario::Reference
  end

  def test_it_retrieves_a_missing_reference
    stub_request(:get, build_api_uri("references", "f2fe28ae-8162-4209-ae1a-a570cadadaeb")).
      with(headers: @headers).
      to_return(use_fixture("GET-Reference-404"))

    result = @subject.retrieve("f2fe28ae-8162-4209-ae1a-a570cadadaeb")

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end

  def test_it_creates_a_reference
    stub_request(:post, build_api_uri("references")).with(headers: @headers).
      to_return(use_fixture("POST-Reference-201"))

    create_reference_params = {
      classification: "Familiar",
      name: "Rick Sanchez",
      phone: "3129764536",
      credit_application_id: "5a00080b-7d3d-4e37-965e-6697729752be"
    }

    result = @subject.create(create_reference_params)

    assert result.is_a? Creditario::Reference
  end

  def test_it_deletes_a_reference
    stub_request(:delete, build_api_uri("references", "78883027-713b-4ac0-be50-b8a67e7bf478")).with(headers: @headers).
      to_return(use_fixture("DELETE-Reference-204"))

    @subject.delete("78883027-713b-4ac0-be50-b8a67e7bf478")
  end
end
