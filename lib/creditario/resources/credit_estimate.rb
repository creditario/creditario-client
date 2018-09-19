# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::CreditEstimate
  #
  # Representa una Estimación de Crédito del sistema creditar.io
  #
  # === Ejemplo
  #
  #   => credit_estimate = Creditario::CreditEstimate.new({ "total_interest_amount_cents": 100000, "total_credit_amount_cents": 1100000 })
  #   => credit_estimate.total_interest_amount_cents
  #   => 100000
  #   => credit_estimate[:total_credit_amount_cents]
  #   => 1100000
  class CreditEstimate
    include Resource
  end
end
