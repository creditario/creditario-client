# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::ConvertApplicationToCredit
  #
  # Convierte una Solicitud en Crédito 
  #
  # === Ejemplo
  #
  # - Convertir una Solicitud de Crédito Simple en Crédito:
  #     result = Creditario::ConvertApplicationToCredits.create({"credit_application_id":"42f815a1-bf0c-4c28-b9e4-96f0173c6ba1", "accepted_at":"2020-05-21", "first_payment_date":"2020-06-20", "closing_date_at":"2020-05-20", "payment_days": "20", "uid": "1"})
  #
  # - Convertir una Solicitud de Línea de Crédito en Crédito:
  #     result = Creditario::ConvertApplicationToCredits.create("credit_application_id":"660f707d-f02d-4c04-af35-907c3808a6ba", "accepted_at":"2020-05-21", "first_payment_date":"2020-06-20", "closing_date_at":"2020-05-20", "payment_days": "20", "uid": "1"})

  class ConvertApplicationToCredit
    include Resource
  end
end
