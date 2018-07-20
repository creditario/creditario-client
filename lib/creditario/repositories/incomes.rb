# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Incomes
  #
  # Repositorio de Ingresos, permite realizar las siguientes operaciones
  # sobre Ingresos para Solicitudes de Crédito de creditar.io
  #
  # - Obtener un Ingreso en especifico:
  #
  #     Creditario::Incomes.retrieve("0b19e3b6-9fae-40e1-a7c2-f2db1cae8a5a")
  #     => Creditario::Income
  #
  # - Crear un Ingreso:
  #
  #     result = Creditario::Incomes.create(classification: "Trabajo", amount_cents: 45000, credit_application_id: "636264b1-77a2-45ef-b643-e44cfbc84d40")
  #     => Creditario::Income
  #
  # - Eliminar un Ingreso:
  #
  #     result = Creditario::Incomes.delete("0b19e3b6-9fae-40e1-a7c2-f2db1cae8a5a")
  #     => Creditario::Income
  module Applications
    extend Creditario::API::Retrieve
    extend Creditario::API::Create
    extend Creditario::API::Delete
    ###
    # Path de la API donde se ejecutan las peticiones para Ingresos.
    def self.resource_path
      "/incomes"
    end

    ###
    # Clase a utilizar para transformar las respuestas de la API.
    def self.resource_class
      Creditario::Income
    end
  end
end
