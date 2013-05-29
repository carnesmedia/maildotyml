module Maildotyml
  class Railtie < ::Rails::Railtie
    initializer 'maildotyml.initialize' do |app|
      Maildotyml.configure(Rails.root.join('config/mail.yml'), Rails.env)
    end
  end
end
