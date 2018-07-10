# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Income
  #
  # Representa un Ingreso del sistema creditar.io
  #
  # === Ejemplo
  #
  #   => income = Creditario::Income.new({"id": "2ff8779b-ba6e-49f2-9be7-73ef20043d1c", "classification": "Trabajo", "amount_cents": 500000})
  #   => income.id
  #   => 2ff8779b-ba6e-49f2-9be7-73ef20043d1c
  #   => income[:amount_cents]
  #   => 500000
  class Income
    include Resource
  end
end
