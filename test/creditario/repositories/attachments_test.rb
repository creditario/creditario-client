# frozen_string_literal: true

require "test_helper"

class Creditario::AttachmentsTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::Attachments
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    }
  end

  def test_it_retrieves_an_attachment
    stub_request(:get, build_api_uri("attachments", "78883027-713b-4ac0-be50-b8a67e7bf478")).
      with(headers: @headers).
      to_return(use_fixture("GET-Attachment-200"))

    result = @subject.retrieve("78883027-713b-4ac0-be50-b8a67e7bf478")

    assert result.is_a? Creditario::Attachment
  end

  def test_it_retrieves_a_missing_attachment
    stub_request(:get, build_api_uri("attachments", "78883027-713b-4ac0-be50-b8a67e7bf479")).
      with(headers: @headers).
      to_return(use_fixture("GET-Attachment-404"))

    result = @subject.retrieve("78883027-713b-4ac0-be50-b8a67e7bf479")

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end

  def test_it_creates_an_attachment
    @headers.delete("Accept")
    @headers["Content-Type"] = "multipart/form-data; boundary=#{Net::HTTP::Post::Multipart::DEFAULT_BOUNDARY}"
    stub_request(:post, build_api_uri("attachments")).with(headers: @headers).
      to_return(use_fixture("POST-Attachments-201"))

    create_attachment_params = {
      attachmentable_type: "customer",
      attachmentable_id: "2e9d05b8-2180-4779-bab6-bdfd41d1569f",
      attachment_type: "INE",
      file: image_fixture
    }

    result = @subject.create(create_attachment_params)

    assert result.is_a? Creditario::Attachment
  end

  def test_it_deletes_an_attachment
    stub_request(:delete, build_api_uri("attachments", "78883027-713b-4ac0-be50-b8a67e7bf478")).with(headers: @headers).
      to_return(use_fixture("DELETE-Attachment-204"))

    assert @subject.delete("78883027-713b-4ac0-be50-b8a67e7bf478")
  end
end
