# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Movements
  #
  # Repositorio de Movimientos, permite obtener la lista de Movimientos a partir de un Crédito.
  #
  # - Listar Movimientos por Crédito:
  #
  #     Creditario::Movements.list(credit_id: "2e9d05b8-2180-4779-bab6-bdfd41d1569f")
  #     => Creditario::ResourcesCollection
  #
  # - Obtener un Movimiento en especifico:
  #
  #     Creditario::Movements.retrieve("998ce380-2a64-4ec8-b414-bbe43b30fa78")
  #     => Creditario::Movement
  #
  # - Crear un Movimiento:
  #
  #     Creditario::Movements.create(reference: "Compra a comercio",amount_cents: 100000,credit_id: "8b3825a0-a0da-424c-9856-bdb126b60860",movement_type: "cargo",interest: false,folio_number: "DWJDHQY")
  #     => Creditario::Movement
  module Movements
    extend Creditario::API::List
    extend Creditario::API::Create
    extend Creditario::API::Retrieve

    ###
    # Path de la API donde se ejecutan las peticiones para Pagos.
    def self.resource_path
      "/movements"
    end

    ###
    # Clase a utilizar para transformar las respuestas de la API
    def self.resource_class
      Creditario::Movement
    end
  end
end
