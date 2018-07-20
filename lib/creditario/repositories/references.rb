# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::References
  #
  # Repositorio de Referencias, permite realizar las siguientes operaciones
  # sobre Referencias para Solicitudes de Crédito de creditar.io
  #
  # - Obtener una Referencia en especifico:
  #
  #     Creditario::References.retrieve("0b19e3b6-9fae-40e1-a7c2-f2db1cae8a5a")
  #     => Creditario::Referencia
  #
  # - Crear una Referencia:
  #
  #     result = Creditario::References.create(classification: "Amistad", name: "Diane Nguyen", phone: "3129743789", credit_application_id: "636264b1-77a2-45ef-b643-e44cfbc84d40")
  #     => Creditario::Referencia
  #
  # - Eliminar una Referencia:
  #
  #     result = Creditario::References.delete("0b19e3b6-9fae-40e1-a7c2-f2db1cae8a5a")
  #     => true
  module References
    extend Creditario::API::Retrieve
    extend Creditario::API::Create
    extend Creditario::API::Delete

    ###
    # Path de la API donde se ejecutan las peticiones para Referencias.
    def self.resource_path
      "/references"
    end

    ###
    # Clase a utilizar para transformar las respuestas de la API.
    def self.resource_class
      Creditario::Reference
    end
  end
end
