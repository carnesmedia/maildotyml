require 'yaml'
require 'erb'
require 'active_support/core_ext/hash/keys'

module Maildotyml
  class Configuration
    attr_reader :file, :environment
    def initialize(file, environment)
      @file, @environment = file, environment
    end

    def delivery_method
      parsed[:adapter]
    end

    def settings
      parsed.reject { |k,v| k == :adapter }
    end

    private

    def parsed
      # TODO: What to do if there is no environment
      @_parsed ||= yaml.fetch(environment).symbolize_keys
    end

    def yaml
      YAML.load ERB.new(file.read).result
    end

  end
end
