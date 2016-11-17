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
        result  = "Decorators::#{model_name}"
        result += "::#{variant.to_s.camelcase}" unless variant.nil?
        result += 'Decorator'
        result
      end
    end
  end
end
