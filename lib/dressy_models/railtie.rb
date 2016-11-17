module DressyModels
  #
  class Railtie < Rails::Railtie
    config.after_initialize do |app|
      app.config.paths.add 'app/decorators'
    end

    initializer 'dressy_models.setup_active_record' do |app|
      ActiveSupport.on_load :active_record do
        DressyModels.setup_active_record self
      end
    end
  end
end
