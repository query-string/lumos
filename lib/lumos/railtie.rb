require "lumos"

module Lumos
  require "rails"

  class Railtie < Rails::Railtie
    initializer "lumos.insert_into_active_record" do |app|
      Lumos::Wrapper.default_options.merge!(app.config.lumos_defaults) if app.config.respond_to?(:lumos_defaults)
    end
  end
end
