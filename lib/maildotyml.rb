require 'maildotyml/version'
require 'maildotyml/configuration'
require 'maildotyml/railtie' if defined?(Rails)

module Maildotyml
  def self.configure(configuration, klass = ActionMailer::Base)
    if configuration.present?
      klass.delivery_method = configuration.delivery_method
      klass.send(:"#{configuration.delivery_method}_settings=", configuration.settings)
    end
  end
end
