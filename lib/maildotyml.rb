require 'maildotyml/version'
require 'maildotyml/configuration'
require 'maildotyml/railtie' if defined?(Rails)


module Maildotyml
  def self.configure(file, environment)
    configuration = Maildotyml::Configuration.new(file, environment)
    ActionMailer::Base.delivery_method = configuration.delivery_method
    ActionMailer::Base.send(:"#{configuration.delivery_method}_settings=", configuration.settings)
  end
end
