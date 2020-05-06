# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::QualifyScoreFlow
  #
  # Representa una Calificación del flujo de calificación del sistema creditar.io
  #
  # === Ejemplo
  #
  #   => score_flow_calification = Creditario::QualifyScoreFlow.new({"value": "100", "passed": "true", "notes": "Resultado sastifactorio"})
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
