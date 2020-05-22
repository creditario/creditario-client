# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::QualifyScoreFlows
  #
  # Repositorio de Calificaciones de flujos de calificación, permite obtener una Calificación de un flujo de calificación
  # en base a una Solicitud de creditar.io:
  #
  # - Obtener una Calificación:
  #
  #     Creditario::QualifyScoreFlows.create(credit_application_id: "c005b7f7-a44a-4ec0-bf7f-73d15d806fd9")
  #     => Creditario::QualifyScoreFlow
  module QualifyScoreFlows
    extend Creditario::API::Create

    ###
    # Path de la API donde se ejecutan las peticiones para Calificaciones de flujos de calificación.
    def self.resource_path
      "/qualify_score_flows"
    end

    ###
    # Clase a utilizar para transformar las respuestas de la API.
    def self.resource_class
      Creditario::QualifyScoreFlow
    end
  end
end
