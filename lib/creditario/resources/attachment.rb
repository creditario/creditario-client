# frozen_string_literal: true

module Creditario # :nodoc
  ###
  # == Creditario::Attachment
  #
  # Representa un Archivo del sistema creditar.io
  #
  # === Ejemplo
  #
  #   => attachment = Creditario::Attachment.new({"id": "aabfd43d-6f63-44dd-b7d9-9352a101d11e", "attachment_type": "INE", "url": "http://creditar.io/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBGUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--4f40e5eabc39d2215d0ce08a1ad735df3bcf74b4/image.jpg"})
  #   => attachment.id
  #   => "aabfd43d-6f63-44dd-b7d9-9352a101d11e"
  #   => attachment[:url]
  #   => "http://creditario.io/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBGUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--4f40e5eabc39d2215d0ce08a1ad735df3bcf74b4/image.jpg"
  class Attachment
    include Resource
  end
end
