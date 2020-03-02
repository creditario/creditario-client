# frozen_string_literal: true

require "test_helper"

class Creditario::MovementsTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::Movements
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe",
    }
  end

  def test_it_list_movements_per_credit
    stub_request(:get, build_api_uri("movements", nil, credit_id: "fc32d052-0334-42db-be73-04685e09c7ef"))
      .with(headers: @headers)
      .to_return(use_fixture("GET-Movements-200"))

    result = @subject.list(credit_id: "fc32d052-0334-42db-be73-04685e09c7ef")

    assert result.is_a? Creditario::PaginatedCollection
    assert_equal result.items.size, 4
  end

  def test_it_retrieves_a_single_movement
    stub_request(:get, build_api_uri("movements", "4f92b15c-61b6-4023-966b-f7b5499cd23c"))
      .with(headers: @headers)
      .to_return(use_fixture("GET-Movement-200"))

    result = @subject.retrieve("4f92b15c-61b6-4023-966b-f7b5499cd23c")

    assert result.is_a? Creditario::Movement
  end

  def test_it_creates_a_movement
    stub_request(:post, build_api_uri("movements"))
      .with(headers: @headers)
      .to_return(use_fixture("POST-Movement-200"))

    result = @subject.create(
      reference: "Compra a KIOSKO",
      amount_cents: 10000,
      credit_id: "fc32d052-0334-42db-be73-04685e09c7ef",
      movement_type: "charge",
    )

    assert result.is_a? Creditario::Movement
  end
end
