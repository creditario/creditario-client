# frozen_string_literal: true

module Creditario # :nodoc:
  ###
  # == Creditario::Resource
  #
  # Modulo que se encarga de establecer el mecanismo de inicialización de las siguientes clases:
  #
  # - Creditario::Product
  # - Creditario::Customer
  # - Creditario::Application
  # - Creditario::Credit
  # - Creditario::Contract
  # - Creditario::Expense
  # - Creditario::Income
  # - Creditario::Reference
  # - Creditario::Attachment
  # - Creditario::CreditEstimate
  # - Creditario::Catalog
  # - Creditario::Payment
  # - Creditario::Movement
  # - Creditario::QualifyScoreFlow
  #
  module Resource
    def self.included(klass) # :nodoc:
      klass.extend ClassMethods
    end

    ###
    # Hash que representa los attributos de un recurso.
    attr_reader :attributes

    ###
    # Colección de links relaccionados al recurso.
    attr_reader :links

    ###
    # Recibe parametro +attributes+ de tipo Hash y genera los métodos de escritura y
    # lectura para cada elemento del Hash.
    def initialize(attributes, links = [])
      @attributes = attributes
      @links = links
      define_attributes_setters_and_getters
    end

    ###
    # Método para acceder con llave al elemento del Hash +attributes+
    def [](key)
      attributes[key]
    end

    ###
    # Método para acceder con llave y sobreescribir el elemento del Hash +attributes+
    def []=(key, value)
      attributes[key] = value
    end

    private

      def define_attributes_setters_and_getters
        attributes.each do |attribute, value|
          if self.class.class_variable_defined?(:@@associations)
            association = self.class.class_variable_get(:@@associations).find { |association| association[:name] == attribute.to_sym }
            unless association.nil?
              attributes[attribute] = build_associations(constantize(association[:class].to_s), value)
            end
          end

          define_attribute_setter_and_getter(attribute, value)
        end
      end

      def constantize(camel_cased_word)
        Object.const_get(camel_cased_word)
      end

      def define_attribute_setter_and_getter(attribute, value)
        self.class.define_method(attribute) do
          attributes[attribute]
        end

        self.class.define_method("#{attribute}=") do |new_value|
          attributes[attribute] = new_value
        end
      end

      def build_associations(klass, collection_or_attributes)
        return klass.new(collection_or_attributes) if collection_or_attributes.is_a?(Hash)

        collection_or_attributes.map do |attributes|
          klass.new(attributes)
        end
      end

      module ClassMethods # :nodoc:
        ###
        # Define una relación de uno a muchos con otro recurso.
        def has_many(*association)
          self.class_variable_set(:@@associations, []) unless self.class_variable_defined?(:@@associations)
          self.class_variable_get(:@@associations) << { name: association.first }.merge(association.last)
        end

        ###
        # Define una relacion de uno a uno con otro recurso.
        def has_one(*association)
          self.class_variable_set(:@@associations, []) unless self.class_variable_defined?(:@@associations)
          self.class_variable_get(:@@associations) << { name: association.first }.merge(association.last)
        end
      end
  end
end
