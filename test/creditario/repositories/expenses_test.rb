# frozen_string_literal: true

require "test_helper"

class Creditario::ExpensesTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::Expenses
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    }
  end

  def test_it_retrieves_an_expense
    stub_request(:get, build_api_uri("expenses", "a1e4a3d7-db86-4ab3-9b2d-cddafd97505c")).
      with(headers: @headers).
      to_return(use_fixture("GET-Expense-200"))

    result = @subject.retrieve("a1e4a3d7-db86-4ab3-9b2d-cddafd97505c")

    assert result.is_a? Creditario::Expense
  end

  def test_it_retrieves_a_missing_expense
    stub_request(:get, build_api_uri("expenses", "a1e4a3d7-db86-4ab3-9b2d-cddafd97505d")).
      with(headers: @headers).
      to_return(use_fixture("GET-Income-404"))

    result = @subject.retrieve("a1e4a3d7-db86-4ab3-9b2d-cddafd97505d")

    assert result.is_a? Hash
    assert result.has_key? "errors"
  end

  def test_it_creates_an_expense
    stub_request(:post, build_api_uri("expenses")).with(headers: @headers).
      to_return(use_fixture("POST-Expense-201"))

    create_expense_params = {
      classification: "Renta",
      amount_cents: 250000,
      credit_application_id: "5a00080b-7d3d-4e37-965e-6697729752be"
    }

    result = @subject.create(create_expense_params)

    assert result.is_a? Creditario::Expense
  end

  def test_it_deletes_an_expense
    stub_request(:delete, build_api_uri("expenses", "a1e4a3d7-db86-4ab3-9b2d-cddafd97505c")).with(headers: @headers).
      to_return(use_fixture("DELETE-Expense-204"))

    assert @subject.delete("a1e4a3d7-db86-4ab3-9b2d-cddafd97505c")
  end
end
