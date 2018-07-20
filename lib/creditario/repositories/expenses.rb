# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Expenses
  #
  # Repositorio de Egresos, permite realizar las siguientes operaciones
  # sobre Egresos para Solicitudes de Crédito de creditar.io
  #
  # - Obtener un Egreso en especifico:
  #
  #     Creditario::Expenses.retrieve("eeedba2e-fc96-4f96-bd2e-bd046b256f96")
  #     => Creditario::Expense
  #
  # - Crear un Egreso:
  #
  #     result = Creditario::Expenses.create(classification: "Renta", amount_cents: 25000, credit_application_id: "636264b1-77a2-45ef-b643-e44cfbc84d40")
  #     => Creditario::Expense
  #
  # - Eliminar un Egreso:
  #
  #     result = Creditario::Expenses.delete("eeedba2e-fc96-4f96-bd2e-bd046b256f96")
  #     => Creditario::Expense
  module Applications
    extend Creditario::API::Retrieve
    extend Creditario::API::Create
    extend Creditario::API::Delete
    ###
    # Path de la API donde se ejecutan las peticiones para Egresos.
    def self.resource_path
      "/expenses"
    end

    ###
    # Clase a utilizar para transformar las respuestas de la API.
    def self.resource_class
      Creditario::Expense
    end
  end
end
