# frozen_string_literal: true

module Creditario # :nodoc:
  class Application # :nodoc:
    include Resource

    has_one :product, class: Creditario::Product
    has_one :contract, class: Creditario::Contract
    has_many :incomes, class: Creditario::Income
    has_many :expenses, class: Creditario::Expense
    has_many :references, class: Creditario::Reference
  end
end
