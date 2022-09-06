# frozen_string_literal: true

module Creditario # :nodoc:
  module Crowdfunding # :nodoc:
    class Crowdfund # :nodoc:
      include Creditario::Resource

      has_one :credit_application, class: "Creditario::Application"
      has_one :credit, class: "Creditario::Credit"
      has_many :funds, class: "Creditario::Crowdfunding::Fund"
    end
  end
end
