# frozen_string_literal: true

module Creditario # :nodoc:
  module Crowdfunding # :nodoc:
    class Fund # :nodoc:
      include Resource

      has_one :investor, class: "Creditario::Crowdfunding::Investor"
      has_one :crowdfund, class: "Creditario::Crowdfunding::Crowdfund"
    end
  end
end
