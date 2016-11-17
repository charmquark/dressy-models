module DressyModels
  #
  module Decoratable
    extend ActiveSupport::Concern

    def decorate(variant = nil)
      decorator_class(variant).new self
    end

    def decorator_class(variant = nil)
      self.class.decorator_class variant
    end

    def decorator_name(variant = nil)
      self.class.decorator_name variant
    end

    class_methods do
      def decorator_class(variant = nil)
        decorator_name(variant).constantize
      end

      def decorator_name(variant = nil)
        result  = (respond_to?(:model_name) ? model_name : name).to_s
        result += "::#{variant.to_s.camelcase}" unless variant.nil?
        result += 'Decorator'
        result
      end
    end
  end
end
