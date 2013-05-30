require 'maildotyml/generators/install_generator'

module Maildotyml
  class Railtie < ::Rails::Railtie
    initializer 'maildotyml.initialize' do |app|
      file = Rails.root.join('config/mail.yml')
      configuration = Maildotyml::Configuration.new(file, Rails.env)
      Maildotyml.configure(configuration)
    end
  end
end
