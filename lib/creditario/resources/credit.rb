# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Credit
  #
  # Representa un Crédito del sistema creditar.io
  #
  # === Ejemplo
  #
  #   => credit = Creditario::Credit.new({"id": "636264b1-dc0d-453e-8804-4ac451e1dbd5", "credit_application_id": "636264b1-77a2-45ef-b643-e44cfbc84d40", "customer_id": "6313ac69-dc0d-45a8-8804-4ac451e1db5c", "contract_id": "0b19e3b6-9fae-40e1-a7c2-f2db1cae8a5a", "installment_plan": [] })
  #   => credit.id
  #   => "636264b1-dc0d-453e-8804-4ac451e1dbd5"
  #   => credit[:customer_id]
  #   => "6313ac69-dc0d-45a8-8804-4ac451e1db5c"
  class Credit
    include Resource
  end
end
