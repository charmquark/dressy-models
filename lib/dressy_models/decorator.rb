module DressyModels
  #
  class Decorator
    def initialize(obj)
      @object = obj
    end

    attr_reader :object

    def decorated?
      true
    end

    def undecorate
      object
    end
  end
end
