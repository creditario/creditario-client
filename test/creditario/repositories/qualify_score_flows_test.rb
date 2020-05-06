# frozen_string_literal: true

require "test_helper"

class Creditario::QualifyScoreFlowsTest < CreditarioAPITest
  def setup
    super
    @subject = Creditario::QualifyScoreFlows
    @headers = {
      "Accept" => "application/vnd.creditar.v1+json",
      "Authorization" => "Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe"
    }
  end

  def test_it_creates_a_score_flow_calification
    stub_request(:post, build_api_uri("qualify_score_flows"))
      .with(headers: @headers)
      .to_return(use_fixture("POST-QualifyScoreFlows-201"))

    result = @subject.create(
      credit_application_id: "5a00080b-7d3d-4e37-965e-6697729752be"
    )

    assert result.is_a? Creditario::QualifyScoreFlow
  end
end
