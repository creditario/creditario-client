# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Attachments
  #
  # Repositorio de Archivos, permite realizar las siguientes operaciones
  # sobre Archivos para Solicitudes de Crédito y Clientes de creditario.io
  #
  # - Obtener un Archivo en especifico:
  #
  #     Creditario::Attachments.retrieve("aabfd43d-6f63-44dd-b7d9-9352a101d11e")
  #     => Creditario::Attachment
  #
  # - Crear un Archivo:
  #
  #     result = Creditario::Attachments.create(attachmentable_type: "credit_application", attachmentable_id: "4e9ece5f-d4e6-4fcd-bc9b-b437bef23ceb", attachment_type: "INE", file: File.new("@/path/to/a/file.jpg"))
  #     => Creditario::Attachment
  #
  # - Eliminar un Archivo:
  #
  #     result = Creditario::Attachments.delete("aabfd43d-6f63-44dd-b7d9-9352a101d11e")
  #     => true
  class Attachments
    extend Creditario::API::Multipart
    extend Creditario::API::Retrieve
    extend Creditario::API::Delete

    ###
    # Path de la API donde se ejecutan las peticiones para Egresos.
    def self.resource_path
      "/attachments"
    end

    ###
    # Clase a utilizar para transformar las respuestas de la API.
    def self.resource_class
      Creditario::Attachment
    end
  end
end
