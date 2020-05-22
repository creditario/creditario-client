# frozen_string_literal: true

module Creditario # :nodoc:
  class Customer # :nodoc:
    include Resource

    has_many :credit_applications, class: Creditario::Application
  end
end
