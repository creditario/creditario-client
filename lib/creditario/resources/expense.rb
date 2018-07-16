# frozen_string_literal: true

module Creditario
  ###
  # == Creditario::Expense
  #
  # Representa un Egreso del sistema creditar.io
  #
  # === Ejemplo
  #
  #   => expense = Creditario::Expense.new({"id": "aff581fc-ba6e-49f2-9be7-73ef20043d1c", "classification": "Renta", "amount_cents": 30000})
  #   => expense.id
  #   => aff581fc-ba6e-49f2-9be7-73ef20043d1c
  #   => expense[:amount_cents]
  #   => 30000
  class Expense
    include Resource
  end
end
