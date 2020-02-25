# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Movement
  #
  # Representa un Movimiento del sistema creditar.io
  #
  # === Ejemplo
  #
  #   => movement = Creditario::Movement.new({"id": "5c9d3d7b-3f64-4a6e-82e2-18acc95870c9","reference": "Compra a comercio","amount_cents": 100000,"credit_id": "97a03292-c521-4495-813d-173d7f371c62","movement_type": "cargo","interest": false,"folio_number": "DWJDHQY"})
  #   => movement.id
  #   => "5c9d3d7b-3f64-4a6e-82e2-18acc95870c9"
  #   => movement.reference
  #   => "Compra a comercio"
  #   => movement.amount_cents
  #   => 100000
  #   => movement.credit_id
  #   => "97a03292-c521-4495-813d-173d7f371c62"
  #   => movement.movement_type
  #   => "cargo"
  #   => movement.interest
  #   => false
  #   => movement.folio_number
  #   => "DWJDHQY"
  class Movement
    include Resource
  end
end
