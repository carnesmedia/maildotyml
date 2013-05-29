require 'maildotyml/version'
require 'maildotyml/configuration'
require 'maildotyml/railtie' if defined?(Rails)

module Maildotyml
  def self.configure(configuration, klass = ActionMailer::Base)
    if configuration.present?
      delivery_method = configuration.delivery_method

      if klass.delivery_methods.include? delivery_method
        klass.delivery_method = delivery_method
        klass.send(:"#{delivery_method}_settings=", configuration.settings)
      else
        available_adapters = klass.delivery_methods.keys
        raise ArgumentError, "ActionMailer does not support the #{delivery_method.inspect} adapter. Available adapters are: #{available_adapters.inspect}"
      end
    end
  end
end
