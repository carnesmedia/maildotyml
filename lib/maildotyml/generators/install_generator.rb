# encoding: utf-8

require 'rails/generators/base'

module Maildotyml
  class InstallGenerator < Rails::Generators::Base
    desc 'Creates a mail.yml configuration file at config/mail.yml.example.'

    def self.source_root
      @_maildotyml_source_root ||= File.expand_path("../templates", __FILE__)
    end

    def create_config_file
      template 'mail.yml.example', File.join('config', 'mail.yml.example')
    end
  end
end
