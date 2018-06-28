# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Product
  #
  # Representa un Producto del sistema creditar.io
  #
  # === Ejemplo
  #
  #   => product = Creditario::Product.new({"id": "6313ac69-dc0d-45a8-8804-4ac451e1db5c", "short_name": "un-pago", "name": "Crédito a un sólo pago"})
  #   => product.id
  #   => "6313ac69-dc0d-45a8-8804-4ac451e1db5c"
  #   => product.short_name = "dos-pagos"
  #   => "dos-pagos"
  #   => product[:name]
  #   => "Crédito a un sólo pago"
  class Product
    include Resource
  end
end
