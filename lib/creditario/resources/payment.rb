# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Payment
  #
  # Representa un Pago del sistema creditar.io
  #
  # === Ejemplo
  #
  #   => payment = Creditario::Payment.new({"id": "6313ac69-dc0d-45a8-8804-4ac451e1db5c", "payment_type": "annuity", "amount_cents": 100000})
  #   => payment.id
  #   => "6313ac69-dc0d-45a8-8804-4ac451e1db5c"
  #   => payment.payment_type = "annuity"
  #   => "annuity"
  #   => payment[:amount_cents]
  #   => 100000
  class Payment
    include Resource
  end
end
