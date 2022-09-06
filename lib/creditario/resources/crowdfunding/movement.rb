# frozen_string_literal: true

require_relative "investor"
require_relative "fund"

module Creditario # :nodoc:
  module Crowdfunding # :nodoc:
    class Movement # :nodoc:
      include Resource

      has_one :investor, class: "Creditario::Crowdfunding::Investor"
      has_one :fund, class: "Creditario::Crowdfunding::Fund"
      has_one :payment, class: "Creditario::Payment"
    end
  end
end
