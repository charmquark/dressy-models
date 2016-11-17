require 'dressy_models/core_ext'
require 'dressy_models/decorator'

require 'dressy_models/railtie' if defined?(Rails)

#
module DressyModels
  def self.setup_active_record(base)
    base.class_eval do
      include DressyModels::Decoratable
    end
  end
end
