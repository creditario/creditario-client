# frozen_string_literal: true

module Creditario # :nodoc:
  module Generators # :nodoc:
    class InstallGenerator < Rails::Generators::Base # :nodoc:
      source_root File.expand_path("templates", __dir__)

      desc "Instala Creditario"

      def install
        copy_file "initializer.rb", "config/initializers/creditario.rb"
        copy_file "creditario.yml", "config/creditario.yml"
        insert_into_file "config/application.rb", "    config.creditario = config_for(:creditario)\n", before: "  end\n"
      end
    end
  end
end
