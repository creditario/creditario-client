# frozen_string_literal: true

module Creditario # :nodoc:
  module Crowdfunding # :nodoc:
    class Investor # :nodoc:
      include Resource

      has_one :customer, class: "Creditario::Customer"
      has_many :funds, class: "Creditario::Crowdfunding::Fund"
      has_many :movements, class: "Creditario::Crowdfunding::Movement"
      has_one :contract, class: "Creditario::Crowdfunding::Contract"
    end
  end
end
