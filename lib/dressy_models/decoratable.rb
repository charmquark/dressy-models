module DressyModels
  #
  module Decoratable
    extend ActiveSupport::Concern

    def decorate(variant = nil)
      decorator_class(variant).new self
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

      def ===(other)
        super other.undecorate
      end
    end
  end
end
