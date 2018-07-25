# frozen_string_literal: true

require "creditario/client"
require "rails"

module Creditario # :nodoc:
  class Railtie < Rails::Railtie # :nodoc:
    railtie_name :creditario

    generators do
      require_relative "../../generators/creditario/install_generator"
    end
  end
end
