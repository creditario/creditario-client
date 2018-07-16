# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Application
  #
  # Representa una Aplicación de Credito del sistema creditar.io
  #
  # === Ejemplo
  #
  #   => credit_application = Creditario::Application.new({"id": "636264b1-77a2-45ef-b643-e44cfbc84d40", "application_number": "UENDSND-1", "flow": "inicio"})
  #   => credit_application.id
  #   => "636264b1-77a2-45ef-b643-e44cfbc84d40"
  #   => credit_application.flow = "referencias"
  #   => "referencias"
  #   => credit_application[:application_number]
  #   => "UENDSND-1"
  class Application
    include Resource

    has_one :product, class: Creditario::Product
    has_many :incomes, class: Creditario::Income
    has_many :expenses, class: Creditario::Expense
    has_many :references, class: Creditario::Reference
  end
end
