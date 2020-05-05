# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::QualifyScoreFlow
  #
  # Representa una Calificación del flujo de calificación del sistema creditar.io
  #
  # === Ejemplo
  #
  #   => score_flow_calification = Creditario::QualifyScoreFlow.new({"credit_application_id": "5c9d3d7b-3f64-4a6e-82e2-18acc95870c9"})
  #   => score_flow_calification.value
  #   => 100
  #   => score_flow_calification.passed
  #   => true
  #   => score_flow_calification.notes
  #   => "Resultado satisfactorio"
  class QualifyScoreFlow
    include Resource
  end
end
