require 'yaml'
require 'erb'
require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/object/blank'

module Maildotyml
  class Configuration
    attr_reader :file, :environment
    def initialize(file, environment)
      @file, @environment = file, environment
    end

    def delivery_method
      parsed[:adapter].to_sym if parsed[:adapter]
    end

    def settings
      map_activerecord_style_keys(parsed.reject { |k,v| k == :adapter })
    end

    def present?
      parsed.present?
    end

    private

    def parsed
      # TODO: What to do if there is no environment
      @_parsed ||= yaml.fetch(environment, {}).symbolize_keys
    end

    def yaml
      if file.exist?
        YAML.load ERB.new(file.read).result
      else
        {}
      end
    end

    def map_activerecord_style_keys(settings)
      settings = settings.dup
      replace_hash_key(settings, :username, :user_name)
      replace_hash_key(settings, :host, :address)

      settings
    end

    def replace_hash_key(hash, before, after)
      hash[after] = hash.delete(before) if hash[before]
    end
  end
end
