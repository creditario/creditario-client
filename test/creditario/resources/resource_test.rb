# frozen_string_literal: true

require "test_helper"

class Creditario::ResourceTest < Minitest::Test
  def setup
    @subject = Class.new do
      include Creditario::Resource
    end
  end

  def test_it_generates_getters
    object = @subject.new(first_name: "Juan", second_name: "Carlos")

    assert_equal object.first_name, "Juan"
    assert_equal object[:second_name], "Carlos"
  end

  def test_it_generates_setters
    object = @subject.new(first_name: "Juan", second_name: "Carlos")

    object.first_name = "María"
    assert_equal object.first_name, "María"

    object[:second_name] = "Guadalupe"
    assert_equal object[:second_name], "Guadalupe"
  end

  def test_it_builds_has_many_associations
    @subject.class_eval do
      has_many :credit_applications, class: Creditario::Application
    end

    object = @subject.new(first_name: "Juan", credit_applications: [{ id: "636264b1-77a2-45ef-b643-e44cfbc84d40" }])

    assert object.credit_applications.any?
    assert object.credit_applications.first.is_a? Creditario::Application
  end

  def test_it_builds_has_one_associations
    @subject.class_eval do
      has_one :product, class: Creditario::Product
    end

    object = @subject.new(product: { id: "6313ac69-dc0d-45a8-8804-4ac451e1db5c" })

    assert object.product.is_a? Creditario::Product
  end
end
