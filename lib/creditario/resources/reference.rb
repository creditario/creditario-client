# frozen_string_literal: true

module Creditario
  ###
  # == Creditario::Reference
  #
  # Representa una Referencia del sistema creditar.io
  #
  # === Ejemplo
  #
  #   => reference = Creditario::Reference.new({"id": "1b38ab7d-4c3e-4f39-99e8-57b099c86d45", "classification": "Familiar", "name": "Diane Nguyen", "phone": "3123100045"})
  #   => reference.id
  #   => 1b38ab7d-4c3e-4f39-99e8-57b099c86d45
  #   => reference[:phone]
  #   => 312100045
  class Reference
    include Resource
  end
end
