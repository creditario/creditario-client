# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Customer
  #
  # Representa un Cliente del sistema creditar.io
  #
  # === Ejemplo
  #
  #   => customer = Creditario::Customer.new({first_name: "Juan", last_name: "Carlos", credit_applications: [{"id": "636264b1-77a2-45ef-b643-e44cfbc84d40"}]})
  #   => customer.first_name
  #   => "Juan"
  #   => customer.first_name = "Pepé"
  #   => "Pepé"
  #   => customer[:first_name]
  #   => "Pepé"
  #   => customer[:first_name] = "Juan"
  #   => "Juan"
  class Customer
    include Resource

    has_many :credit_applications, class: Creditario::CreditApplication
  end
end
