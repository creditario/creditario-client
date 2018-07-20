# # frozen_string_literal: true

# require "test_helper"

# class Creditario::IncomesTest < CreditarioAPITest
#   def setup
#     super
#     @subject = Creditario::Incomes
#     @headers = {
#       "Accept" => "application/vnd.creditar.v1+json",
#       "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
#     }
#   end

#   def test_it_list_applications
#     stub_request(:get, build_api_uri("applications")).
#       with(headers: @headers).
#       to_return(use_fixture("GET-Applications-200"))

#     result = @subject.list

#     assert result.is_a? Creditario::PaginatedCollection
#     assert_equal result.items.size, 2
#   end

#   def test_it_retrieves_an_application
#     stub_request(:get, build_api_uri("applications", "3c8b46ce-a5f2-4f25-8280-a80551eacd21")).
#       with(headers: @headers).
#       to_return(use_fixture("GET-Application-200"))

#     result = @subject.retrieve("3c8b46ce-a5f2-4f25-8280-a80551eacd21")

#     assert result.is_a? Creditario::Application
#   end

#   def test_it_retrieves_a_missing_application
#     stub_request(:get, build_api_uri("applications", "9c8b46ce-a5f2-4f25-8280-a80551eacd21")).
#       with(headers: @headers).
#       to_return(use_fixture("GET-Application-404"))

#     result = @subject.retrieve("9c8b46ce-a5f2-4f25-8280-a80551eacd21")

#     assert result.is_a? Hash
#     assert result.has_key? "errors"
#   end

#   def test_it_creates_an_application
#     stub_request(:post, build_api_uri("applications")).
#       with(headers: @headers).
#       to_return(use_fixture("POST-Application-201"))

#     create_application_params = {
#       customer_id: "eeedba2e-fc96-4f96-bd2e-bd046b256f96",
#       product_id: "c005b7f7-a44a-4ec0-bf7f-73d15d806fd9"
#     }

#     result = @subject.create(create_application_params)

#     assert result.is_a? Creditario::Application
#   end

#   def test_it_creates_an_application_fail
#     stub_request(:post, build_api_uri("applications")).
#       with(headers: @headers).
#       to_return(use_fixture("POST-Application-422"))

#     create_application_params = {
#       customer_id: "eeedba2e-fc96-4f96-bd2e-bd046b256f96",
#       product_id: "ff864c12-d3b7-45b5-8fb4-7fd4e5d42668" # Inactive Product
#     }

#     result = @subject.create(create_application_params)

#     assert result.is_a? Hash
#     assert result.has_key? "errors"
#   end

#   def test_it_updates_an_application
#     stub_request(:patch, build_api_uri("applications", "382aa3f2-aa2b-454c-940a-03aa711d0aec")).
#       with(headers: @headers).
#       to_return(use_fixture("PATCH-Application-202"))

#     application_params = {
#       street: "Wakanda",
#       city: "Black Panta",
#       interior_number: "78"
#     }

#     result = @subject.update("382aa3f2-aa2b-454c-940a-03aa711d0aec", application_params)

#     assert result.is_a? Creditario::Application
#   end

#   def test_it_updates_an_application_fail
#     stub_request(:patch, build_api_uri("applications", "382aa3f2-aa2b-454c-940a-03aa711d0aec")).
#       with(headers: @headers).
#       to_return(use_fixture("PATCH-Application-422"))

#     application_params = {
#       amount_cents: "invalid data"
#     }

#     result = @subject.update("382aa3f2-aa2b-454c-940a-03aa711d0aec", application_params)

#     assert result.is_a? Hash
#     assert result.has_key? "errors"
#   end

#   def test_it_updates_an_application_not_found
#     stub_request(:patch, build_api_uri("applications", "952aa3f2-aa2b-454c-940a-03aa711d0aec")).
#       with(headers: @headers).
#       to_return(use_fixture("PATCH-Application-404"))

#     application_params = {
#       street: "Wakanda Foreva"
#     }

#     result = @subject.update("952aa3f2-aa2b-454c-940a-03aa711d0aec", application_params)

#     assert result.is_a? Hash
#     assert result.has_key? "errors"
#   end
# end
