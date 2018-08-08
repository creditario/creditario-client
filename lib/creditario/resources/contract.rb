# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Contract
  #
  # Representa un Contrato del sistema creditar.io
  #
  # === Ejemplo
  #
  #   => contract = Creditario::Contract.new({"id": "c005b7f7-a44a-4ec0-bf7f-73d15d806fd9", body: "Contrato del Crédito..."})
  #   => contract.id
  #   => "c005b7f7-a44a-4ec0-bf7f-73d15d806fd9"
  #   => contract.body
  #   => "Contrato del Crédito..."
  #   => contract[:body]
  #   => "Contrato del Crédito..."
  class Contract
    include Resource
  end
end
